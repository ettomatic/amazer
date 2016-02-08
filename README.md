# Amazer
A simple random maze generator

# Setup

```
bundle install
bundle exec rackup
```

Now you can visit the web interface at
[http://127.0.0.1:9292](http://127.0.0.1:9292).

Use this command to run the test suite:

```
bundle exec rspec
```

# Endpoints

`/maze` generates a radom maze

```
$ curl http://localhost:9292/maze
<pre>
+---+---+---+---+---+---+---+---+---+---+
| S |       |                           |
+   +   +---+   +---+   +   +   +   +---+
|           |       |   |   |   |   |   |
+---+---+   +   +---+   +---+---+   +   +
|               |           |           |
+   +   +   +   +---+---+---+---+---+---+
|   |   |   |       |                   |
+---+   +---+---+   +---+   +---+---+---+
|   |   |                               |
+   +---+---+---+   +---+---+---+---+   +
|           |               |           |
+   +---+   +---+---+---+   +---+---+---+
|   |   |                   |           |
+---+   +---+   +---+---+   +---+---+   +
|   |   |   |   |   |   |               |
+   +   +   +---+   +   +---+   +---+---+
|       |   |       |   |       |       |
+---+   +   +   +   +   +   +---+---+   +
|               |                     E |
+---+---+---+---+---+---+---+---+---+---+
</pre>
```

##Params

- `size` Defaults to 10, will set the resolution of the maze eg `/maze?size=6` will produce a 36 rooms maze.
- `solution` Defaults to false, `maze/?solution=true` will show the path to solve the maze (TBD)
