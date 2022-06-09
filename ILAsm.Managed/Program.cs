////////////////////////////////////////////////////////////////////
//
// ILAsm.Managed - Portable managed Mono IL assembler.
// Copyright (c) Sergey Chaban (serge@wildwestsoftware.com)
// Copyright (c) Jackson Harper (Jackson@LatitudeGeo.com)
// Copyright (c) Kouji Matsui (@kozy_kekyo, @kekyo@mastodon.cloud)
//
// Licensed under MIT: https://opensource.org/licenses/mit
//
////////////////////////////////////////////////////////////////////

namespace Mono.ILASM;

public static class Program
{
    public static int Main(string[] args) =>
        Driver.Main(args);
}
