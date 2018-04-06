#proves the law of large numbers via coin toss

#global values
heads <- c(0);
tails <- c(0);

#Main method
	print("Generating data");
	flipCoins(10);
	flipCoins(100);
	flipCoins(1000);
	flipCoins(10000);
	flipCoins(100000);
	flipCoins(1000000);
	flipCoins(10000000);
	print("Graphing data");
	

#function to flip coins. 
flipCoins <- function(iterations = 0) {
	iHeads <- 0;
	iTails <- 0;
	for (i in 1:iterations) {
		iHold = rnorm(1, 0, 1)
		if (iHold > 0) {
			iHeads = iHeads + 1;
		} else {
			iTails = iTails + 1;
		}
	}
	heads <- c(heads, iHeads);
	tails <- c(tails, iTails);
	print(paste(c("Heads =", calcPercentage(iHeads, iterations), " Tails =", calcPercentage(iTails, iterations)), collapse = " "));

}
#function to calculate percentage, returns formatted string
calcPercentage <- function(num,total) {
	iHold = (num / total) * 100;
	result = paste(c(iHold, "%"),collapse = ""); 
	return(result);
}

#function to return a graph
drawGraph <- function() {
	# Give the chart file a name.
	png(file = "line_chart_2_lines.jpg");

	# Plot the bar chart.
	plot(heads, type = "o", col = "red", xlab = "Percentage", ylab = "Iterations",
   main = "Coin flip results");

	lines(tails, type = "o", col = "blue")
	dev.off();
}