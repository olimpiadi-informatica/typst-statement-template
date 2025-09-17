#import "template.typ": *

/* Setting the statement language for localization */
#set text(lang: "en")
#override_localization.update(_ => (:))

/* Statement content block */
#statement[
Given two integers $A$ and $B$, print their sum.

/* Figures are insert with the figure command */
#figure(
  image("image.png", width: 30%),
  caption: "C++ implements addition"
)

/* Note box for useful remarks */
#note[
  In this task, all numbers fit in a $32$-bit signed integers.
]

/* Warn box for important remarks */
#warn[
  Carries may happen while adding numbers. For this hard task, examples can be found in the #link(<examples>, [Examples])
]

#implementation

You should submit a single file, with a `.cpp` or `.py` extension.

#note[
  Among the attachments of this task you will find some templates #raw(task_name)`.*` with a sample implementation.
]

You will have to implement the following function:

/* Signatures box for grader functions */
#signatures(
  (
    ("cpp", "void sum(int A, int B);"),
    ("py", "def sum(A: int, B: int):"),
  )
)

- The integer $A$ and $B$ are the ones you have to sum.
- The function should return the sum of $A$ and $B$.

#samplegrader

Among this task’s attachments you will find a simplified version of the grader used during evaluation,
which you can use to test your solutions locally. The sample grader reads data from #raw(infile),
calls the function `sum` and writes back on #raw(outfile) using the following format.

The input file is formed by $2$ lines, containing:

- Line $1$: an integer $A$.
- Line $2$: an integer $B$.

The output file is formed by a single line, containing the value returned by the function `sum`.

#constraints
- $0 <= A, B <= constraint.MAXA$

#scoring

Your program will be tested against several test cases grouped in subtasks.
In order to obtain the score of a subtask, your program needs to correctly solve all of its test cases.

/* OII style subtasks - remove if not needed */
#subtasks((
  subtask => [Samples],
  subtask => [$A, B <= subtask.MAXA$],
  subtask => [$A = subtask.MAXA$],
  subtask => [No additional constraint],
))

Your program will be tested against several test cases grouped in subtasks.
In order to obtain the score of a subtask, your program needs to correctly solve all of its test cases.

/* OIS style subtasks - remove if not needed */
#ois_subtasks((
  subtask => [Samples],
  subtask => [$A, B <= subtask.MAXA$],
  subtask => [$A = subtask.MAXA$],
  subtask => [No additional constraint],
), (1, 2, 5, 3))

/* Samples - the argument is the number of samples */
#examples(2)

#explanation

In the *first sample case*, we are asked to compute $1+3=4$.\
In the *second sample case*, we are asked to compute $2+5=7$.\
]

/* Editorial content block - can be omitted 
 * Compile with `task-maker-tools booklet --booklet-solutions`
 */
#editorial[
Is is enough to sum $A$ and $B$.
]
