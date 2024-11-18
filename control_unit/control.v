

//32    	25 24       20 19       15 14   12 11         7 6             0
//____________________________________________________________________________
//| a a a a a a a | b b b b b | c c c c c | d d d | e e e e e | f f f f f f f |
//-----------------------------------------------------------------------------
//     FUNC7          RS2         RS1       FUNC3     RD           OPCODE
//                             ---
//                            |   |
//                            |   |
//                            \   /
//                             \ /
//________________________________________
//| a a a a a a a | d d d | f f f f f f f |
//----------------------------------------
//   FUNC7          FUNC3     OPCODE
//
module control_unit (
    input [6:0] func7,
    input [2:0] func3,
    input [6:0] opcode,
    output reg [3:0] alu_control,
    output reg reg_we
);  

    always @(func3 or func7 or opcode)
    begin
    	if (opcode == 7'b0110011) //opcode is R type
	    begin 
	        reg_we = 1;
		alu_control = { func7[6] , func3[2:0] }  ;
            end
    end
endmodule
