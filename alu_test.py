import cocotb
from cocotb.regression import TestFactory
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles
from cocotb.clock import Clock

@cocotb.test()
async def alu_test(dut):
    dut._log.info("--- START TEST ---------------------------------")
    await Timer(2, units='ns')
    dut.input_a.value = 22
    dut.input_b.value = 3
    await Timer(2, units='ns')
    dut.op_code.value = 8
    await Timer(2, units='ns')
    dut._log.info(" la suma es %d" % dut.result.value)
    dut._log.info("--- END TEST ---------------------------------")