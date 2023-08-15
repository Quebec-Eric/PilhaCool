class Node {
    val : String;
    next : Node;

    init(v : String, n : Node) : Node {
        {
            val <- v;
            next <- n;
            self;
        }
    };

    getVal():String{
        let valretorno: String <- "" in {

        valretorno <- val; 
            
        valretorno;
        }
    };

    getNextNode():Node{
        next
    };

};

class Stack inherits IO {
    top : Node;
    
    init() : Stack {
        {
            top <-  (new Node).init("F", top);
            self;
        }
    };

    push(v : String) : Stack {
        {
            top <- (new Node).init(v, top);
            self;
        }
    };

    pop() : String{
        let retorno: String <- "" in {
            retorno<- top.getVal();
            top<-top.getNextNode();
            retorno;
        }
    };
   


    peek() : String {
        let fact: String <- "" in {
        fact <- top.getVal(); 
        fact;
        }
    };
  
  
};

class Main inherits IO {
    eric:Stack;
    
    main() : Object {
        {
            eric <- new Stack.init();
            self.entradaDados();
        }
    };

    entradaDados() : Object {
        let input_string : String <- in_string() in
        {
            while not (input_string = "X") loop
                {
                    if (input_string = "n") then
                        self.mostraN(input_string)
                    else
                        if (input_string = "+") then
                            self.mostraMais()
                        else
                            if (input_string = "s") then
                                self.mostraS()
                            else
                                if (input_string = "e") then
                                    self.mostraE()
                                else
                                    if (input_string = "d") then
                                        self.mostraD()
                                    else
                                        out_string("Você inseriu: ".concat(input_string).concat("\n"))
                                    fi
                                fi
                            fi
                        fi
                    fi;
                    input_string <- in_string();
                }
            pool;
            out_string("Terminando o programa.\n");
        }
    };

    mostraN(input_string : String) : Object {
        {
           
          eric.push("o dado e bonito");
                   
        }
    };

    mostraMais() : Object {
        {
            (new IO).out_string(eric.pop());   
            out_string("Você inseriu '++++++++++++'.\n");
        }
    };

    mostraS() : Object {
        {
            out_string("Você inseriu 'ssssssssssss'.\n");
        }
    };

    mostraE() : Object {
        {
            out_string("Você inseriu 'eeeeeeeeeeeeeeee'.\n");
        }
    };

    mostraD() : Object {
        {
            out_string("Você inseriu 'ddddddddddd'.\n");
        }
    };
};
