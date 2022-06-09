# ILAsm.Managed

Portable managed Mono IL assembler.

[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

* [![NuGet ILAsm.Managed](https://img.shields.io/nuget/v/ILAsm.Managed.svg?style=flat)](https://www.nuget.org/packages/ILAsm.Managed)
* [![NuGet ILAsm.Managed.Core](https://img.shields.io/nuget/v/ILAsm.Managed.Core.svg?style=flat)](https://www.nuget.org/packages/ILAsm.Managed.Core)

----

## What is this?

Mono IL assembler exactly ported to .NET, .NET Core and .NET Frameworks.

Target platforms:

* .NET 6.0 and 5.0
* .NET Core 3.1 and 2.2
* .NET Standard 2.1 and 2.0
* .NET Framework 4.8, 4.6.1, 4.5, 4.0, 3.5 and 2.0

There are two packages for this project, which can be used for different purposes:

* [`ILAsm.Managed`](): Contains ported Mono ilasm executable (CLI interface).
* [`ILAsm.Managed.Core`](): Pure library for ported Mono ilasm.

----

## ILAsm.Managed

You can refer to MSBuild symbols as properties.
Using this property, you can easily run the CLI interface in a multi-platform environment:

```xml
<!-- Execute Mono ilasm CLI -->
<Exec WorkingDirectory="$(ILAsmManagedBuildToolingDir)"
    Command="$(ILAsmManagedBuildToolingRuntimeName)&quot;$(ILAsmManagedBuildToolingPath)&quot; ...." />
```

For those of you who can't be bothered to look it up, here is some help on Mono ilasm CLI:

```
C:\Projects\ILAsm.Managed\ILAsm.Managed\bin\Debug\net40>ilasm.exe
Mono IL assembler compiler
ilasm [options] source-files
   --about            About the Mono IL assembler compiler
   --version          Print the version number of the compiler
   /output:file_name  Specifies output file.
   /exe               Compile to executable.
   /dll               Compile to library.
   /debug             Include debug information.
   /key:keyfile       Strongname using the specified key file
   /key:@container    Strongname using the specified key container
   /noautoinherit     Disable inheriting from System.Object by default
Options can be of the form -option or /option
```

----

## ILAsm.Managed.Core

This library contains up to just before the `Main` entry point.
It can be used directly in MSBuild custom tasks or when incorporating ILAsm into your own implementation.
However, since the original implementation is made into a library as is, it may not be easy to handle.

The CLI entry point can be accomplished with a single line as follows:

```csharp
namespace Mono.ILASM;

public static class Program
{
    public static int Main(string[] args) =>
        Driver.Main(args);
}
```

----

## Background

This is a further derivative project of [IL2C](https://github.com/kekyo/IL2C) and [ILCompose](https://github.com/kekyo/ILCompose).
In fact, the original authors are to be commended, as they simply ported the Mono ilasm artifact to a modern environment.

Currently (.NET 6), Microsoft's CoreCLR team is working on a port of the .NET Framework's ILAsm,
[Microsoft.NETCore.ILAsm](https://www.nuget.org/packages/Microsoft.NETCore.ILAsm) and a set of derivative packages.
These include native binaries, i.e., binaries specific to Windows and Linux (different for each distribution).

There are [SDK scripts for IL](https://www.nuget.org/packages/Microsoft.NET.Sdk.IL) that reference these packages from the `<PackageReference>` tag.
However, there is a fatal problem with this method.
Commands such as `dotnet restore` and `nuget restore` do not evaluate the MSBuild scripts when resolving package references.
Therefore, this package reference actually fails and the build always fails.

No, if you build from Visual Studio, you can build.
So I finally discovered this problem by failing to build with GitHub Actions.
I thought of various solutions, but in the end, as long as ILAsm is native code,
it is difficult (at least to an outsider) to fundamentally solve this problem.

So we looked into Mono's ILAsm and found that it was fully managed code, albeit clunky, so we decided to port it.

----

## License

Under MIT excepts original Mono source code, [see Mono License](https://github.com/mono/mono/blob/main/LICENSE).
