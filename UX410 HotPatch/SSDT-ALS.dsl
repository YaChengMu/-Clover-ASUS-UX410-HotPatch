/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLXsAHLi.aml, Sun Oct 29 13:31:04 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000FB (251)
 *     Revision         0x01
 *     Checksum         0x17
 *     OEM ID           "hack"
 *     OEM Table ID     "backligh"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 1, "hack", "backligh", 0x00003000)
{
    External (_SB_.ALAE, FieldUnitObj)    // (from opcode)
    External (_SB_.ALSA, FieldUnitObj)    // (from opcode)
    External (_SB_.ATKD, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.EC0_.RRAM, MethodObj)    // 1 Arguments (from opcode)
    External (ALAE, IntObj)    // Warning: Unknown object
    External (ALSA, UnknownObj)    // Warning: Unknown object
    External (RRAM, IntObj)    // Warning: Unknown object

    Scope (\_SB.PCI0.LPCB.EC0)
    {
        Method (RALS, 0, NotSerialized)
        {
            If (ALAE)
            {
                Store (RRAM (0x02A3), Local0)
                Store (RRAM (0x02A4), Local1)
                ShiftLeft (Local0, 0x08, Local0)
                Add (Local0, Local1, Local0)
                Multiply (Local0, 0x03E8, Local1)
                Divide (Local1, ALSA, Local2, Local3)
            }
            Else
            {
                Return (0x012C)
            }

            Return (Local3)
        }
    }

    Scope (\_SB.ATKD)
    {
        Method (ALSS, 0, NotSerialized)
        {
            Return (^^PCI0.LPCB.EC0.RALS ())
        }
    }
}

