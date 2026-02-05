## GeneSSE Implementation

This subdirectory contains the codes for processing disjunctive queries q = w_1 OR w_2 OR ... OR w_n

Change the database name variable in ```main_single_thread.cpp``` file. The database file should formatted as an inverted-index with the first column containing keywords as 4-byte hex values, and the next columns containing associated document identifiers as 4-byte hex values (all separated by commas, even at the end). Meta-keywords are  generated in real-time during updates. 


Compile the GeneSSE impementation

```bash
make genesse
```
Run the GeneSSE impementation

```bash
./genesse_out
```

Clean the project
```bash
make clean_all
```


# RGeneSSE Implementation
This subdirectory contains the codes for processing range queries of the form [x,y] efficiently and return the document identifiers that lie in the range while ensuring strong privacy against volume-pattern leakages. We pre-process the an update of the form (op,id,{attr,val}) into a BST T and an index DB as a pre-processing step and then call the GeneSSE_Update function. For a range search, canonical covers are generated and the nodes are converted into meta-query and send to the GeneSSE_Search function.


## Important Functions Implemented
###Update:
BuildTree(DB): Constructs a binary tree over the domain of the database, assigning a unique keyword to each node.
BuildIndex(Tree): Builds an index from the binary tree, associating each data tuple with the keywords corresponding to its range in the tree.
RGeneSSE.Update(λ, Index): Encrypts the index using the GeneSSE_Update function to produce the encrypted database (EDB).

###Search:
GenRangeCover(Tree, [x, y]): Generates the minimal covering set of nodes that cover the query range [x, y].
RGeneSSE.Search(query, EDB): Executes the disjunctive search query on the encrypted database by calling GeneSSE_Search function and returns the results.


```bash
make pre_process

```

```bash
make genesse
```

```bash
./genesse_out
```

Clean the project
```bash
make clean_all
```