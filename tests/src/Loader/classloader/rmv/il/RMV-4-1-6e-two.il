// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

.assembly extern System.Console { }
//Check that each named argument must be accessible to the caller (properties this time)

.assembly extern 'RMV-4-CA'{}
.assembly extern mscorlib {}

.assembly 'RMV-4-1-6a'{
  .custom instance void ['RMV-4-CA']MyCA::.ctor() = ( 01 00 01 00 54 08 0F 50 72 76 49 6E 73 74 50 72   // ....T..PrvInstPr
                                                      6F 70 65 72 74 79 03 00 00 00 )                   // operty....
}

.class CMain extends [mscorlib]System.Object{
	.method public static int32 Main(){
		.entrypoint
		ldstr	"FAIL - 4.1.6a - Was allowed to declare a customattribute whose prolog isn't 0x0001"
		call	void [System.Console]System.Console::WriteLine(string)
		ldc.i4  100
		ret
	}
}
