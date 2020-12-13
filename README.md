# AutomaticThresholding
Iterative thresholding method has been used.

Automatic thresholding is analyzing the gray value distribution in an image, 
histogram of the gray values, and uses the knowledge about the application
to select the most appropriate threshold. Where these knowledges can be:
- Intensity characteristics of objects
- Sizes of the objects
- Fractions of an image occupied by the objects
- Number of different types of objects appearing in an image
Iterative thresholding selection is a way to selecting decisive value 
automatically. It starts with selecting initial estimate threshold. 
It can be average intensity of image. Region separation can be done into 
two groups. Then calculation of each mean gray values of these regions 
give, u1 and u2. Next threshold value will be:

𝑇=0.5∗(𝑢1+𝑢2)

Then repeat this iteration until u1=u2.