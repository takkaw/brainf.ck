class Brainf {
  string program;
  int tape[30000];
  int i_ptr; // instruction pointer
  int t_ptr; // tape pointer
  int len;   // program size
  KBHit kb;

  fun void init() {
   // initialize
    0 => i_ptr;
    for( 0 => int i ;  i < 30000 ; i++ ){
      0 => tape[i];
    }
    program.length() => len;
  }

  fun void run(string s){
    s => program;
    run();
  }

  fun void run(){
    init();
    while( i_ptr < len ){
      program.get_at(i_ptr) => string s;

           if( s == ">" ) t_ptr++;
      else if( s == "<" ) t_ptr--;
      else if( s == "+" ) 1 +=> tape[t_ptr];
      else if( s == "-" ) 1 -=> tape[t_ptr];
      else if( s == "." ) chout <= Std.chr(tape[t_ptr]);
      //else if( s == "." ) chout <= tape[t_ptr] <= IO.nl();  // for debug
      else if( s == "," ) { kb => now; kb.getchar() => tape[t_ptr]; }
      else if( s == "[" ) {
        if( tape[t_ptr] == 0 ) {
          1 +=> i_ptr;
          for( 1 => int depth ; depth ; 1 +=> i_ptr ){
            if( program.get_at(i_ptr) == "[" ) 1 +=> depth;
            else if( program.get_at(i_ptr) == "]" ) 1 -=> depth;
          }
        }
      }
      else if( s == "]" ) {
        if( tape[t_ptr] != 0 ){
          1 -=> i_ptr;
          for( 1 => int depth ; depth ; 1 -=> i_ptr ){
            if( program.get_at(i_ptr) == "]" ) 1 +=> depth;
            else if( program.get_at(i_ptr) == "[" ) 1 -=> depth;
          }
        }
      }
      1 +=> i_ptr;
    }
  }
}

"
++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++
++++++++.
+++++++.
--------.
--.
" @=> string hoge1;

"
>+++++++++[<++++++++>-]<.>+++++++[<++++>-]<+.+++++++..+++.[-]>++++++++[<++
++>-]<.>+++++++++++[<+++++>-]<.>++++++++[<+++>-]<.+++.------.--------.[-]>
++++++++[<++++>-]<+.[-]++++++++++.
" @=> string HelloWorld;

"
++++++++++[>++++++++++<-]>
++++.+++++++.--------.--.
" @=> string hoge2;

"
+[>,.<]
" @=> string echo;

"
++++>++><<
[-
  >[->>+<<]
  >>[-<+<+>>]
  <<<
]>>
++++++++++++++++++++++++++++++++++++++++++++++++.
" @=> string multiple;

"
+++++++++
[
  ->++++++++>+++++++++++>+++++<<<
]
>.>++.+++++++..+++.>-.------------.<++++++++.--------.+++.------.--------.>+.
" @=> string helloworld;

"
>++++[<++++++++>-]>++++++++[<++++++>-]<++.<.>+.<.>++.<.>++.<.>>++[<--->-]
<..<.>.++.<.>--.>++[<+++>-]<.<.>>++[<--->-]<.>++[<++++>-]<.<.>>++[<--->-]
<-.+.<.>-.>+++[<++>-]<+.<.>>++[<--->-]<.--.<.>++.++++.<.>---.---.<.>++.-
.<.>+.+++.<.>--.--.<.>++.++++.<.>---.-----.<.>+++++.+.<.>.>++[<--->-]<.<.
>>++[<+++>-]<.----.<.>++++.++.<.>-.-----.<.>+++++.+.<.>.--.
" @=> string prime;

Brainf bf;
bf.run(helloworld);
bf.run();

