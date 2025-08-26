{ config, lib, pkgs, ... }:

{
environment.systemPackages = with pkgs; [
	dotnet-sdk # for c#
	gcc # for c++ 
  ];

# c# tested and worked but the output was not the same - 
#// See https://aka.ms/new-console-template for more information 
#Console.WriteLine("Hello, World!");
#which is newer and the reason why and the code if typed yourself and also works is also the same as -
#using System;
#class Program
#{
#    static void Main(string[] args)
#    {
#        Console.WriteLine("Hello, C#!");
#    }
#}

# warning I used AI for this info down/under

#mkdir MyCSharpApp
#cd MyCSharpApp
#dotnet new console #This creates a basic console application with a Program.cs file

#using System;
#class Program
#{
#    static void Main(string[] args)
#    {
#        Console.WriteLine("Hello, C#!");
#    }
#}

# Build and run the program # dotnet run
# C# does not require gcc or g++. The .NET SDK includes everything needed to compile and run C# code. It uses its own compiler (csc) and runtime.

# c# up / c++ down

#To write, compile, and run C++ programs, you need a C++ compiler. The most common choice is g++, which is part of the GNU Compiler Collection (gcc). On NixOS, you can install gcc (which includes g++ for C++) using the Nix package manager.

#test if works - 
#include <iostream>
#int main() {
#    std::cout << "Hello, C++!" << std::endl;
#    return 0;
#}

# compile it : g++ hello.cpp -o hello
#Run the program : ./hello

}
