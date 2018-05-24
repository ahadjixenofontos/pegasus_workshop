### <font color="#008080"> Workshop: Pegasus data workflow </font>

<br>
Athena Hadjixenofontos, PhD
<br>
Director of Engagement
<br>
Center for Computational Science
<br><br>
ahadjixenofontos@miami.edu
<br>

---

@title[Roadmap]
## <font color="#008080"> Roadmap </font>

- Write your first LSF batch job
- Organize your project directories
- Transfer input files to Pegasus 
- Calculate allele frequencies for all chromosomes in parallel
- Plot allele frequencies 

---?image=images/aerial-view-architecture-bridges-681335.jpg

Note:
Remember that the major difference that makes LSF necessary in the first place is that we are now operating on a shared resource. If we use the highway infrastructure analogy and compare it to local backroads, it means that we can go places that are far away and do so very fast, but it also means that we'll encounter many more other cars on the road. 

---

@title[LSF options]
## <font color="#008080"> LSF options </font>

Check out the example script for a serial job at ccs.miami.edu/ac/docs

---

@title[Get off the login node]
## <font color="#008080"> First things first </font>

Request an interactive node by running: <br>
```bsub -Is -P <project_name> bash```
<br><br>
Why is this important?

---

@title[Project directories: best practices]
## <font color="#008080"> Project directories: best practices </font>

- Avoid excessive nesting of directories
- Keep your original data safe and separate
- Using date prefix can help you avoid digging
- Use descriptive names for both directories and files
- Keep notes about the files in each directory in a readme

---

@title[Create a project directory structure]
## <font color="#008080"> Create a project directory tree </font>

- scripts
- data
- results 

--- 

@title[Transfer input files to Pegasus]
## <font color="#008080"> Transfer files to Pegasus </font>

```
scp /Downloads/data/* username@pegasus.ccs.miami.edu:~/pegasus_workshop/data
```
Look up other options for [file transfers](ccs.miami.edu/ac/docs) 

---

@title[File formats]
## <font color="#008080"> What do we have? </font>

Let's take a peek at the data. 
<br><br>
[.ped file format description](https://www.cog-genomics.org/plink/1.9/formats#ped)

---

@title[Let's write the job files!]
## <font color="#008080"> Let's write the jobs! </font>

You have options for how to generate files that contain the minor allele frequencies for the variants in our dataset. 

---

@title[Option 1]
## <font color="#008080"> Option 1 </font>

Use a shell for or while loop to iterate through the input files. 
<br><br>
What are the pros and cons?

---

@title[Option 2]
## <font color="#008080"> Option 2 </font>

Write a separate job file for each input file. 
<br><br>
What are the pros and cons?

---

@title[Other options?]
## <font color="#008080"> Other options </font>

What other options do we have?

---

@title[The hundreds of input files problem]
## <font color="#008080"> With hundreds of input files... </font>

... you don't want to write a separate job file for each of them - at least not manually. 

---

@title[Write a script to write the job scripts]
## <font color="#008080"> Automate job file writing </font>

One option would be to write a script that when executed writes as many job files as there are input files. 
<br>
Let's do that. 

---

@title[Installing the tools we'll need]
## <font color="#008080"> Install plink </font>

1. Go to https://www.cog-genomics.org/plink2 
2. Download the stable build for a Linux 64-bit system. 
3. On Pegasus, create a folder in your /nethome called programs
4. Transfer the downloaded .zip file to your /nethome/programs
5. Run `unzip plink_linux_x86_64.zip`
6. Test that you can run plink by running `/path/to/executable/plink` without any arguments

---

@title[When to load the modules]
## <font color="#008080"> Module loading decisions </font>

If we were using a pre-installed program, we would need to decide how transparent to be about what our environment looks like. 
<br><br>
Why?

---

@title[Interactive development]
## <font color="#008080"> Develop interactively </font>

First, we need to figure out the exact plink command(s) to use for calculating minor allele frequencies from our data files. 
<br><br>
Figure it out by navigating back to https://www.cog-genomics.org/plink2 and looking through the options in the column on the left. 

---

@title[Submitting lots of jobs]
## <font color="#008080"> Automate job file submission </font>

We'd also rather not submit these jobs one by one. <br>
Let's write a script to do that for us. 

---

@title[Let the computer do the work]

Let the computer do the work!











