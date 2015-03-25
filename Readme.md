## Tic tac toe

<img src="https://raw.githubusercontent.com/ankit8898/tic-tac-toe/master/images/ttt.png" width="200" height="200""/>

<i>Features</i>

- Play against computer
- Flexible Grid size. For N * N grid.  <b>Don't stop your self to a 3 * 3 </b>. :sunglasses:
- Declares Winner

<i>Algorithm used</i>

There are various implementation available over the web for tic tac toe and [for N * N Implementation](http://stackoverflow.com/questions/4198955/how-to-find-the-winner-of-a-tic-tac-toe-game-of-any-size).  But, i haven't used them .  

The winner of the Grid can be any time decided if

- We have one of the winning pattern in a Row

<img src="https://raw.githubusercontent.com/ankit8898/tic-tac-toe/master/images/row.jpg" "/>


- We have one of the winning pattern in a Column

<img src="https://raw.githubusercontent.com/ankit8898/tic-tac-toe/master/images/column.jpg" "/>
- We have one of the winning pattern in a Diagonal
<img src="https://raw.githubusercontent.com/ankit8898/tic-tac-toe/master/images/diagonal.jpg" "/>


The Alogorithm scans all 3 combinations after every move.

### Getting running

```ruby

$ bundle install
$ bundle exec rake #starts the game

```

### Interface

1) Interactive terminal

![Alt text](https://raw.githubusercontent.com/ankit8898/tic-tac-toe/master/images/interface.png)


2) Declares winner :clap:

![Alt text](https://raw.githubusercontent.com/ankit8898/tic-tac-toe/master/images/winner.png)


### Testing


We use Rspec for testing :heart:

![Alt text](https://raw.githubusercontent.com/ankit8898/tic-tac-toe/master/images/test.png)


Run tests via

```ruby
$ bundle exec rspec
```
