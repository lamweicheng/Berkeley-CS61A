import sys

from pair import *
from scheme_utils import *
from ucb import main, trace

import scheme_forms

##############
# Eval/Apply #
##############


def scheme_eval(expr, env, _=None):  # Optional third argument is ignored
    """Evaluate Scheme expression EXPR in Frame ENV.

    >>> expr = read_line('(+ 2 2)')
    >>> expr
    Pair('+', Pair(2, Pair(2, nil)))
    >>> scheme_eval(expr, create_global_frame())
    4
    """
    # Evaluate atoms
    if scheme_symbolp(expr):
        return env.lookup(expr)
    elif self_evaluating(expr):
        return expr

    # All non-atomic expressions are lists (combinations)
    if not scheme_listp(expr):
        raise SchemeError('malformed list: {0}'.format(repl_str(expr)))
    first, rest = expr.first, expr.rest
    if scheme_symbolp(first) and first in scheme_forms.SPECIAL_FORMS:
        return scheme_forms.SPECIAL_FORMS[first](rest, env)
    else:
        # BEGIN PROBLEM 3

        #evaluate the operator
        operator = scheme_eval(first, env)

        #evaluate all of the operands
        operands = rest.map(lambda x: scheme_eval(x, env))


        #return the result of applying the procedure to the evaluated operands by calling scheme_apply 
        result = scheme_apply(operator, operands, env)
        return result


     

        # frame = env.make_call_frame(procedure.formals,args)
        # return scheme_eval(procedure.body,frame)
        # END PROBLEM 3


def scheme_apply(procedure, args, env):
    """Apply Scheme PROCEDURE to argument values ARGS (a Scheme list) in
    Frame ENV, the current environment."""
    validate_procedure(procedure)
    if not isinstance(env, Frame):
       assert False, "Not a Frame: {}".format(env)
    if isinstance(procedure, BuiltinProcedure):
        
        # BEGIN PROBLEM 2

        #Convert the Scheme list to a Python list of arguments 
        #while args(Scheme List) is not empty, append all the args into the args_list
        args_Python_List = []
        while args is not nil:
            args_Python_List.append(args.first)
            args = args.rest


        #if the procedure.need_env is True, then add the current environment as the last argument to the Python List
        if procedure.need_env is True:
            args_Python_List.append(env)


        # END PROBLEM 2
        try:
            # BEGIN PROBLEM 2s
            
            #return the result of calling procedure.py_func on all of those arguments
            return procedure.py_func(*args_Python_List)
            # END PROBLEM 2

        except TypeError as err:
            raise SchemeError('incorrect number of arguments: {0}'.format(procedure))
    elif isinstance(procedure, LambdaProcedure):
        # BEGIN PROBLEM 9
        
        #create a new Frame instance using the make_child_frame method of the 
        #appropriate parent frame, binding formal parameters to argument values.
        newFrameInstance = procedure.env.make_child_frame(procedure.formals, args)
        
        #evaluate each of the expressions of the body of the procedure using eval_all within this new frame.
        exprEvaluation = eval_all(procedure.body, newFrameInstance)

        #return the evaluated expressions
        return exprEvaluation

        # END PROBLEM 9
    elif isinstance(procedure, MuProcedure):
        # BEGIN PROBLEM 11
        
        #
        newFrameInstance = env.make_child_frame(procedure.formals, args)
        return eval_all(procedure.body, newFrameInstance)


        # END PROBLEM 11
    else:
        assert False, "Unexpected procedure: {}".format(procedure)


#expressions here is a Scheme list of expressions
#env here is a Frame representing the current environment
def eval_all(expressions, env):
    """Evaluate each expression in the Scheme list EXPRESSIONS in
    Frame ENV (the current environment) and return the value of the last.

    >>> eval_all(read_line("(1)"), create_global_frame())
    1
    >>> eval_all(read_line("(1 2)"), create_global_frame())
    2
    >>> x = eval_all(read_line("((print 1) 2)"), create_global_frame())
    1
    >>> x
    2
    >>> eval_all(read_line("((define x 2) x)"), create_global_frame())
    2
    """
    # BEGIN PROBLEM 6
    #return scheme_eval(expressions.first, env)  # replace this with lines of your own code

    
    #if the list of expressions is empty then it should return the Python value None, which represents the Scheme 
    # value undefined  
    if expressions is nil:
        return None

    value = nil

    #loop through every expressions until the value is bind to the last expression in expressions
    while expressions is not nil:
        value = scheme_eval(expressions.first, env)
        expressions = expressions.rest
    
    #return the value of the last expression  
    return value    


    # END PROBLEM 6


##################
# Tail Recursion #
##################

class Unevaluated:
    """An expression and an environment in which it is to be evaluated."""

    def __init__(self, expr, env):
        """Expression EXPR to be evaluated in Frame ENV."""
        self.expr = expr
        self.env = env


def complete_apply(procedure, args, env):
    """Apply procedure to args in env; ensure the result is not an Unevaluated."""
    validate_procedure(procedure)
    val = scheme_apply(procedure, args, env)
    if isinstance(val, Unevaluated):
        return scheme_eval(val.expr, val.env)
    else:
        return val


def optimize_tail_calls(unoptimized_scheme_eval):
    """Return a properly tail recursive version of an eval function."""
    def optimized_eval(expr, env, tail=False):
        """Evaluate Scheme expression EXPR in Frame ENV. If TAIL,
        return an Unevaluated containing an expression for further evaluation.
        """
        if tail and not scheme_symbolp(expr) and not self_evaluating(expr):
            return Unevaluated(expr, env)

        result = Unevaluated(expr, env)
        # BEGIN PROBLEM EC
        "*** YOUR CODE HERE ***"
        # END PROBLEM EC
    return optimized_eval


################################################################
# Uncomment the following line to apply tail call optimization #
################################################################
#scheme_eval = optimize_tail_calls(scheme_eval)