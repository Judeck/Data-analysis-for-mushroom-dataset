# Data Set: Mushroom 
These data sets are described in agaricus-lepiota.data and agaricus-lepiota.names

Objective: There are two classes: edibles and poisonous. But, there are some mushrooms (#TBD) which are uncertain, but are classified as poisonous. Your job is to determine of which the poisonous class are actually the uncertain category by applying clustering, classification, and prediction techniques discussed in class as well as additional functions from the packages mentioned.

You will need to divide your data set into a training set and a test set. Use samples of 50-50, 60-40, and 70-30 for the training-test ratios

Try plotting the data using several plotting functions to see what it looks like. Use pairs (e.g., 2D plots) or 3 variables (3D plots) based on the packages. 

Try to filter the data by selecting samples with only certain attribute values and plotting them.

You should try data reduction to eliminate some attributes through Principal Components Analysis. The idea is to try and select N attributes that will help you focus on identifying the unsure samples.

We discussed a number of techniques in lectures 4 and 5, but you can use other techniques from the contributed R packages.

2. This will involve some statistical analysis and some clustering. Use the R packages and functions in the notes as well as the ones below. 

3. Deliverables: You will deliver your results by putting a zipfile in your group’s Blackboard file, with the following naming convention: Group-N-Project-2.zip, where N is your group number. Your deliverable should encompass the following items:

A listing of all R functions that you have written
•	A document giving your results which should include:
a. A description of the edible, poisonous classes and the uncertain category, respectively, based on the features using three different clustering methods such as kmeans, k-nearest neighbor, or one other in the R contributed packages. Clearly identify which methods you are using.

Note: The first column in the data set has e for edible and p for poisonous. All well and good but that does not tell you what features distinguish them. That is what you have to determine.
b. a clustering of the samples into N = 3, 5, 7 classes using the three different clustering methods. The idea is to see how the clustering method and its underlying assumptions changes your perspective on the data.
c. prepare a table containing the data from (a & b) with the three training-test ratios for each of the N and each clustering method
d. plots using several methods in lectures 4 and 5.

You should investigate some of the statistics of the data set

4. Try the lm and glm methods to get linear fits for the data. This will not work on all attributes, so you must determine which ones it will work on. Note as discussed in class binomial (logit) expects two categories, so you might combine the two data sets into one and determine if you can distinguish between and how good the fit it.

5. Use SVM as well to try to separate the combined data set into two separate classes.

See the slides for book chapters to read to help you. Try different methods in glm, build a table and record the relevant data. What can you determine from the table of values?

Approach:

You should determine what to do and divide the work up among the team members after creating the different training and test subsets. 

Remember to save your workspace! In your Group area would be a good place so all members can get to it.

Include in your Word document the results required
(use a  CTRL-ALT-PrintScreen) to grab the screen
You may use Irfanview 4.40, irfanview@gmx.net. Paste in the screen image, and copy the image as JPEG to drop into your Word document.

6. Project #2 Value: 15 points
a. Document R functions that you write: 2 points
b. Table with results as specified in 3 above: 3 points
c. Discussion of results from the experiments that you run in part 3b above. Which clustering version gives the best results? What seems to be the best number of clusters for each method? --- 3 points
d. Table from 4 above – 3 points
e. Plots with discussion of results: which plot helped you understand the data best and why? – 3 points
f. Analysis of what this project helped you learn about data science, e.g., the exploration of data which is what you have been doing – 1 point. You must argue persuasively.

Review the documentation for the packages and functions that you use.

 

