#!/usr/bin/env ruby

require "optparse"

def sh(cmd) = (puts "$ #{cmd}"; Process.wait(spawn cmd))

usage = "Usage: new [options] [lang] <path>"
opts = {version: "0.1.0"}
lang, path, * = OptionParser.new(usage)
  .on("-nNAME", "--name NAME")
  .on("-lSPDX", "--license SPDX")
  .parse!(into: opts)

raise "Usage: new [options] [lang] <path>" if lang.nil?

path, lang = [lang] if path.nil?
name = opts[:name] || path
version = opts[:version]
license = opts[:license]

Dir.mkdir path
Dir.chdir path

sh "git init"
case lang
when "ts"
  sh "mkdir src"

  puts "+ package.json"
  f = open("package.json", "w") << <<~eos
  {
    "name": "#{name}",
    "version": "0.1.0"
  eos
    .strip
  f << ",\n  \"license\": \"#{license}\"" if license
  f << <<~eos

  }
  eos

  puts "+ dprint.json"
  open("dprint.json", "w") << <<~eos
  {
    "typescript": {
      "quoteStyle": "preferDouble"
    },
    "excludes": ["**/node_modules"],
    "plugins": [
      "https://plugins.dprint.dev/typescript-0.94.0.wasm",
    ]
  }
  eos

  puts "+ tsconfig.json" << <<~eos
  {
    "compilerOptions": {
      "strict": true,
      "baseUrl": "./src",
      "module": "ESNext",
      "moduleResolution": "bundler",
      "noEmit": true,
      "target": "ESNext"
    }
  }
  eos

  puts "+ src/index.ts"
  open("src/index.ts", "w")
when "c", "cpp"
  sh "mkdir src"

  puts "+ meson.build"
  meson = open("meson.build", "w") << <<~eos
  project(
    '#{name}', '#{lang}',
    version: '#{version}'
  eos
    .strip
  meson << ",\n  license: '#{license}'" if license
  meson << <<~eos
  )

  subdir('src')
  eos

  puts "+ src/meson.build"
  open("src/meson.build", "w") << <<~eos
  executable('#{name}', 'main.cc')
  eos

  puts "+ src/main.cc"
  open("src/main.cc", "w") << <<~eos
  int main() {
    return 0;
  }
  eos
end
