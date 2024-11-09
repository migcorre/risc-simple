import cocotb
from cocotb.regression import TestFactory
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles
from cocotb.clock import Clock

@cocotb.test()
async def alu_test(dut):
    dut._log.info("############# START TEST #################")
    dut._log.info("******** ADD [0000] *********************")
    await Timer(2, units='ns')
    dut.input_a.value = 18
    dut.input_b.value = 3
    await Timer(2, units='ns')
    dut.op_code.value = 0b0000
    await Timer(10, units='ns')
    dut._log.info("la suma de A=%d + B=%d es %d", dut.input_a.value, dut.input_b.value, dut.result.value)
    await Timer(10, units='ns')

    dut._log.info("******** SUB [1000]  *********************")
    await Timer(2, units='ns')
    dut.input_a.value = 20
    dut.input_b.value = 6
    await Timer(2, units='ns')
    dut.op_code.value = 0b1000 
    await Timer(10, units='ns')
    dut._log.info("la suma de A=%d + B=%d es %d", dut.input_a.value, dut.input_b.value, dut.result.value)
    await Timer(10, units='ns')
    dut._log.info("--- END TEST ---------------------------------")
