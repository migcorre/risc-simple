# https://tinytapeout.com/es/hdl/testing/
import cocotb
from cocotb.regression import TestFactory
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles
from cocotb.clock import Clock

async def write_and_read_memory(dut, address, data):
    # Habilitar la escritura asincrónica
    dut.data_in.value = data
    dut.address.value = address
    await Timer(10, units='ns')
    dut.write_enable.value = 1
    # Deshabilitar la escritura
    await Timer(10, units='ns')
    dut.write_enable.value = 0
    await Timer(10, units='ns')
    # Lectura sincrona
    dut.address.value = address
    await Timer(10, units='ns')
    assert dut.data_out.value == data
    # Verificar si los datos de lectura coinciden con los datos escritos
    #assert dut.data_out_sync.value = data
    #"PASO juju"
    #f"Error en la dirección {address}. Esperado: {data}, Leído: {dut.data_out_sync.value}"

@cocotb.test()
async def registers_test(dut):
    dut._log.info("--- START TEST ---------------------------------")
    clock = Clock(dut.clk, 1, units="ns")
    cocotb.start_soon(clock.start())
    # Inicialización
    dut.write_enable.value = 0
    dut.address.value = 0
    dut.data_in.value = 0
    await ClockCycles(dut.clk, 10)
    await Timer(10, units='ns')
    # Deshabilitar la escritura
    # Realizar escrituras y lecturas en la memoria
    #write_and_read_memory(dut, 0, 0xDEADBEEF)
    #write_and_read_memory(dut, 1, 0xABCD1234)
    await write_and_read_memory(dut, 2, 5)
    dut._log.info(" dato leido %s" % dut.data_out.value)

