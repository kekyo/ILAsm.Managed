# ILAsm.Managed - Portable Mono IL assembler.



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

## License

Under MIT excepts original Mono source code, [see Mono License](https://github.com/mono/mono/blob/main/LICENSE).
