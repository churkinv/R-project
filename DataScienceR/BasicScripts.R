
#assigning a variable
x <- "Hello Wolrd";
y = "Hellow Y";
"Hello Z" -> z;

#implicit printing, dispaying variables
print(z);

#explicit printing, dispaying variables
x;
y;
z

#creating variables
l <- TRUE;
i <- 123L;
n <- 1.23;
c <- "ABC";
d <- as.Date(2001 - 02 - 03);

#creating a function
f <- function(x) { x + 1 };

#invoking a function
f(2)

#creating a vector
v <- c(1, 2, 3);
v

#creating a sequence
s <- 1:5; # in ascending order
s;

#creating a matrix
m <- matrix(data = 1:6, nrow = 2, ncol = 3);
m;

#creating an array
a <- array(data = 1:8, dim = c(2, 2, 2));
a;

#creating a list
l <- list(TRUE, 123L, 2.34, "abc");
l;

#creating a factor
categories <- c("Male", "Female", "Male", "Male", "Female");
factor <- factor(categories);
factor;
levels(factor);
unclass(factor);

#creating a data frame
df <- data.frame(
                 Name = c("cat", "dog", "cow", "pig"),
                 HowMany = c(5, 10, 15, 20),
                 IsPet = c(TRUE, TRUE, FALSE, FALSE));
df;

#indexing data frames by row and columns
df[1, 2];

#indexing data frames by row
df[1,];

#indexing data frames by columns
df[, 2];
df[["HowMany"]];
df$HowMany;

#subsetting data frames
df[c(2, 4),];
df[2:4,];
df[c(TRUE, FALSE, TRUE, FALSE),];#will return us rows 1 and 3 which are TRUE
df[df$IsPet == TRUE,];
df[df$HowMany > 10,];
df[df$Name %in% c("cat", "cow"),];

#R is a vectorized language
1 + 2;
c(1, 2, 3) + c(2, 4, 6);

#named vs ordered arguments
m <- matrix(data = 1:6, nrow = 2, ncol = 3);
n <- matrix(1:6, 2, 3);
m == n;
identical(m, n);

#instaling  packages 
install.packages("dplyr");

#loading packages
library("dplyr");

#viewing help
? data.frame;

