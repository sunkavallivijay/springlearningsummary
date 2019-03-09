### Setup (Mac):
- Download the dmg file
- Extract the app to Application like any other MAC application
- Set path using `export PATH="/Applications/Julia-1.0.app/Contents/Resources/julia/bin:$PATH"`
- Installed Julia-lang extension in VSCode; Atom installation didn't work and too many issues
- Good to go now

### Adding External Libraries:
- Julia comes with built in package manager
- To enable it open Julia terminal (REPL) and issue `using Pkg`
- There is a bug in Pkg manager so first run `rm(joinpath(homedir(), ".julia", "registries"); recursive=true)`
[Packages Manual](https://docs.julialang.org/en/v0.6/manual/packages/)



- Julia keeps file in: ~/.julia/ (~ is user homd directory)


[Julia-Lang extension](https://marketplace.visualstudio.com/items?itemName=julialang.language-julia)