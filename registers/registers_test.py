# https://tinytapeout.com/es/hdl/testing/
import cocotb
from cocotb.regression import TestFactory
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles
from cocotb.clock import Clock

async def initialization(dut):
    dut.reg_to_write_addr.value = 0
    dut.reg_stored_1_addr.value = 0
    dut.reg_stored_2_addr.value = 0
    dut.reg_to_write_data.value = 0
    dut.we.value = 0

async def write_reg(dut, address, data):
    # Habilitar la escrtura asincrónica
    dut.reg_to_write_addr.value = address
    dut.reg_to_write_data.value = data
    dut.we.value = 0
    await Timer(2, units='ns')
    dut.we.value = 1
    await Timer(2, units='ns')
    dut.we.value = 0


async def read_reg1(dut, addr):
    global data
    # Lectura sincrona
    dut.reg_stored_1_addr.value = addr
    await Timer(5, units='ns')
    data = dut.reg_stored_1_data.value
    await Timer(5, units='ns')

async def read_reg2(dut, addr):
    global data
    # Lectura sincrona
    dut.reg_stored_2_addr.value = addr
    await Timer(5, units='ns')
    data = dut.reg_stored_2_data.value
    await Timer(5, units='ns')

@cocotb.test()
async def registers_test(dut):
    dut._log.info("--- START TEST ---------------------------------")
    clock = Clock(dut.clock, 1, units="ns")
    cocotb.start_soon(clock.start())
    # Inicialización
    await initialization(dut)
    dato = 5
    register = 20
    dut._log.info("writing dato %d in register %d", dato, register)
    await write_reg(dut, register, dato)
    await Timer(2, units='ns')
    dato = 18
    register = 22
    dut._log.info("writing dato %d in register %d", dato, register)
    await write_reg(dut, register, dato)
    #await ClockCycles(dut.clk, 10)
    await Timer(10, units='ns')
    register = 20
    await read_reg1(dut, register)
    dut._log.info("read data %d from address %d", data, register )
    register = 22
    await read_reg2(dut, register)
    dut._log.info("read data %d from address %d", data, register)

