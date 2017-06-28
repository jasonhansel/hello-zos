//* Hello World in z/OS Assembler.
//* The assembly code is embedded directly within this file;
//* you can compile, link, and run the code with "asm-build.sh".
//* https://ibm.co/2ueANpc was used as a reference.
//HELLOASM JOB ,,MSGLEVEL=1
//CLR EXEC PROC=ASMACLG
//C.SYSIN DD *
HELLO CSECT
* Use 24-bit mode for I/O
HELLO RMODE 24
HELLO AMODE 31
* Print assembly after macroexpansion
  PRINT GEN
* Save registers and set up USING, so that the linker can use R11
* to find our code.
  SAVE (14,12)
  BASR 11,0
  USING *,11
  ST 13,SAVEAREA+4
  LR 12,13
  LA 13,SAVEAREA
  ST 13,8(12)
* Print HELLOMSG to the output.
  OPEN (SYSPRINT,(OUTPUT))
  PUT SYSPRINT,HELLOMSG
* Restore registers from SAVEAREA.
  L 13,SAVEAREA+4
  RETURN (14,12),RC=0
* The save area. Technically this shouldn't be part of the CSECT.
SAVEAREA DS 18F
* The string itself. Must be 133 characters to match LRECL below.
HELLOMSG DC CL133' Hello world from assembly!'
HELLO  CSECT
* DCB so that we can run SYSPRINT. Note continuation character at EOL.
SYSPRINT DCB DSORG=PS,MACRF=PM,DDNAME=SYSPRINT,                        ,
               RECFM=FA,LRECL=133,BLKSIZE=133
  END
/*
//G.SYSPRINT DD SYSOUT=*