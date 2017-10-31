/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt-ptswak.aml, Mon Oct 30 14:14:23 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000002D5 (725)
 *     Revision         0x02
 *     Checksum         0xBC
 *     OEM ID           "hack"
 *     OEM Table ID     "PTSWAK"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "PTSWAK", 0x00000000)
{
    External (_SB_.PCI0.PEG0.PEGP._OFF, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.PEG0.PEGP._ON_, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.PEGP.DGFX._OFF, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.PEGP.DGFX._ON_, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.XHC_.PMEE, FieldUnitObj)    // (from opcode)
    External (_SI_._SST, MethodObj)    // 1 Arguments (from opcode)
    External (RMCF.DPTS, IntObj)    // (from opcode)
    External (RMCF.SHUT, IntObj)    // (from opcode)
    External (RMCF.SSTF, IntObj)    // (from opcode)
    External (RMCF.XPEE, IntObj)    // (from opcode)
    External (ZPTS, MethodObj)    // 1 Arguments (from opcode)
    External (ZWAK, MethodObj)    // 1 Arguments (from opcode)

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If ((0x05 == Arg0))
        {
            If (CondRefOf (\RMCF.SHUT))
            {
                If (\RMCF.SHUT)
                {
                    Return (Zero)
                }
            }
        }

        If (CondRefOf (\RMCF.DPTS))
        {
            If (\RMCF.DPTS)
            {
                If (CondRefOf (\_SB.PCI0.PEG0.PEGP._ON))
                {
                    \_SB.PCI0.PEG0.PEGP._ON ()
                }

                If (CondRefOf (\_SB.PCI0.PEGP.DGFX._ON))
                {
                    \_SB.PCI0.PEGP.DGFX._ON ()
                }
            }
        }

        ZPTS (Arg0)
        If ((0x05 == Arg0))
        {
            If (CondRefOf (\RMCF.XPEE))
            {
                If ((\RMCF.XPEE && CondRefOf (\_SB.PCI0.XHC.PMEE)))
                {
                    \_SB.PCI0.XHC.PMEE = Zero
                }
            }
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (((Arg0 < One) || (Arg0 > 0x05)))
        {
            Arg0 = 0x03
        }

        Local0 = ZWAK (Arg0)
        If (CondRefOf (\RMCF.DPTS))
        {
            If (\RMCF.DPTS)
            {
                If (CondRefOf (\_SB.PCI0.PEG0.PEGP._OFF))
                {
                    \_SB.PCI0.PEG0.PEGP._OFF ()
                }

                If (CondRefOf (\_SB.PCI0.PEGP.DGFX._OFF))
                {
                    \_SB.PCI0.PEGP.DGFX._OFF ()
                }
            }
        }

        If (CondRefOf (\RMCF.SSTF))
        {
            If (\RMCF.SSTF)
            {
                If (((0x03 == Arg0) && CondRefOf (\_SI._SST)))
                {
                    \_SI._SST (One)
                }
            }
        }

        Return (Local0)
    }
}

