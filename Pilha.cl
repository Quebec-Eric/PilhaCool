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

class Stack inherits A2I {
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

    displayStack() : SELF_TYPE {
        let current: Node <- top in
        {
            while not (current.getVal() = "F") loop
                {
                    (new IO).out_string(current.getVal()).out_string("\n");
                    current <- current.getNextNode();
                }
            pool;
            self;
        }
    };
   


    peek() : String {
        let fact: String <- "" in {
        fact <- top.getVal(); 
        fact;
        }
    };

evaluateStack() : SELF_TYPE {
    let current: Node <- top in
    {
        while not (current.getVal() = "F") loop
            {
                if not (current.getNextNode().getVal() = "F") then
                    {
                        if not (current.getNextNode().getNextNode().getVal() = "F") then
                            let next: Node <- current.getNextNode() in
                            let nextNext: Node <- next.getNextNode() in
                            {
                                if (next.getVal() = "+") then
                                    let operand1: Int <- self.a2i(current.getVal()) in
                                    let operand2: Int <- self.a2i(nextNext.getVal()) in
                                    let result: Int <- operand1 + operand2 in
                                    let resultStr: String <- self.i2a(result) in
                                    {
                                        current.init(resultStr, nextNext.getNextNode());
                                    }
                                else
                                    current <- current.getNextNode()
                                fi;
                            }
                        else
                            current <- current.getNextNode()
                        fi;
                    }
                else
                    current <- current.getNextNode()
                fi;
            }
        pool;
        self;
    }
};


isNumber(str: String) : Bool {
    if (str = "0") then 
        true
    else 
        if (str = "1") then 
            true
        else 
            if (str = "2") then 
                true
            else 
                if (str = "3") then 
                    true
                else 
                    if (str = "4") then 
                        true
                    else 
                        if (str = "5") then 
                            true
                        else 
                            if (str = "6") then 
                                true
                            else 
                                if (str = "7") then 
                                    true
                                else 
                                    if (str = "8") then 
                                        true
                                    else 
                                        if (str = "9") then 
                                            true
                                        else 
                                            false
                                        fi
                                    fi
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
};

   
};
  
  


class Main inherits IO {
    eric:Stack;
    
    main() : Object {
        {
            eric <- new Stack.init();
            out_string("\n--------------------------------- \n");
            out_string("\n Acoes a se fazer na pilha \n");
            out_string("\n (+), (INT), (s) , vao ser adicionados na pilha \n");
            out_string("\n (e) Ver adiante na pilha e fazer a matematica \n");
            out_string("\n (d) Exibir toda a pilha\n");
            out_string("\n (t) Exibir topo da pilha\n");
            out_string("\n (X) Finalizar o programa\n");
            out_string("\n--------------------------------- \n");
            self.entradaDados();
        }
    };

    entradaDados() : Object {
        let input_string : String <- in_string() in
        {
            while not (input_string = "X") loop
                {
                    
                    if (input_string = "+") then
                        self.mostraN("+")
                    else
                            if (input_string = "s") then
                                self.mostraN("s")
                            else
                                if (input_string = "e") then
                                    self.mostraE()
                                else
                                    if (input_string = "d") then
                                        self.mostraD()
                                    else

                                    if (input_string = "t") then
                                        self.mostraMais()
                                    else
                                        self.mostraN(input_string)
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
           out_string("\n--------------------------------- \n");
           out_string("\n Adicionado o valor na pilha\n");
           eric.push(input_string);
           out_string("\n--------------------------------- \n");
                   
        }
    };

    

    mostraMais() : Object {
        {
            out_string("\n");
            (new IO).out_string(eric.pop());
            out_string("\n");   
            
        }
    };

    

    mostraE() : Object {
        {
           out_string("\n--------------------------------- \n");
           out_string("\n Ver Adiante na pilha\n");
            eric.evaluateStack();
            out_string("\n--------------------------------- \n");  
        }
    };

    mostraD() : Object {
        {
            out_string("\n--------------------------------- \n");
           out_string("\n Mostrar a pilha \n");
            eric.displayStack();
            out_string("\n--------------------------------- \n"); 
        }
    };
};
