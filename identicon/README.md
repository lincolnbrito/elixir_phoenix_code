# Identicon

**Create an Identicon, image based on Github avatar generation rules**

## Concepts
TODO

## Install deps
```> mix local.rebar --force``` (issue related)

close and re-open terminal and run:

```> mix deps.get```

## Usage
```iex> Identicon.main("example")``` 

generates *example.png*

![](example.png)

## Issues

### :egd.create/0 is undefined: 
**:egd** isn't the part of Erlang-OTP release anymore. To solve  add to dependencies:

```{:egd, github: "erlang/egd"}```

Once **:egd** is added, install **rebar** (erlang build tool), as this library depends on rebar.

```> mix loca.rebar --force```

After installing rebar close and re-open the terminal and run:

```> mix deps.get```

[Quora answer - Erlang: egd not working inside Elixir on Windows.?](https://www.quora.com/Erlang-egd-not-working-inside-Elixir-on-Windows/answer/Arif-Hussain-Bangash)

## TODO
- [] Enum.chunk is deprecated use Enum.chunk_every instead