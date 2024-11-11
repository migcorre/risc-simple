We implement 32 registers with a width of 32 bits.

![image](https://github.com/user-attachments/assets/4f08e916-8e07-4058-bcef-f21f91fcf81b)

for reading is an asyn read of the register, ie, the value is constaly going out from towards the outputs,  and for for writing we sent a we signal to 1 and in one clock cycle we save the data in the selected register.

we create a simple test in cocotb calls registers_test.py 

![image](https://github.com/user-attachments/assets/86f67923-d8d6-48c9-adc7-28ca8297387a)
