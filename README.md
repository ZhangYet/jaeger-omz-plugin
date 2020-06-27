# jaeger plugin #

CLI support for jaeger interaction

## Description ##

This plugin provides command line tools for iteracting with [jaeger](https://www.jaegertracing.io/).

## Install ##

``` bash
cd ~/.oh-my-zsh/plugins
git clone https://github.com/ZhangYet/jaeger-omz-plugin.git jaeger
```

Then edit your `.zshrc`, add `jaeger` to plugins, for example:

``` bash
plugins=(git fzf jaeger)
```

## Usage ##

``` bash
jaeger trace [traceId]          # open a brower tab searching [traceId] in [envurl]
jaeger setenv [env] [envurl]    # set [envurl] corresponding to [env]
jaeger switch [env]             # switch [env]
```

For example, your company has two environments: test and live.

``` bash
jaeger setenv test http://test.jaeger.yourcompany.com
jaeger setenv live http://live.jaeger.yourcompany.com # now the plugin use http://live.jaeger.yourcompany.com to trace your request
```

If you want to trace a request(which traceId is xxxxxxxxxxxx for example):

``` bash
jaeger trace xxxxxxxxxxxx 
```

If you want to trace a request in test environment, you can switch environment at first.

``` bash
jaeger switch test
jaeger trace xxxxxxxxxxxx
```

