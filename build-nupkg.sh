#!/bin/sh

# ILAsm.Managed - Portable managed Mono IL assembler.
# Copyright (c) Sergey Chaban (serge@wildwestsoftware.com)
# Copyright (c) Jackson Harper (Jackson@LatitudeGeo.com)
# Copyright (c) Kouji Matsui (@kozy_kekyo, @kekyo@mastodon.cloud)
#
# Licensed under MIT: https://opensource.org/licenses/mit

echo
echo "==========================================================="
echo "Build ILAsm.Managed"
echo

dotnet build -p:Configuration=Release -p:Platform="Any CPU" -p:RestoreNoCache=True ILAsm.Managed.sln
dotnet pack -p:Configuration=Release -p:Platform="Any CPU" -o artifacts ILAsm.Managed.sln
