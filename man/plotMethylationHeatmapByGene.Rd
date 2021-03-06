\name{plotMethylationHeatmapByGene}
\alias{plotMethylationHeatmapByGene}
\title{
plot methylation heatmap by genes
}
\description{
plot methylation heatmap by genes
}
\usage{
plotMethylationHeatmapByGene(selGene, methyGenoSet, gene2tx = NULL, expression.tx = NULL, expression.other = NULL, 
	phenoData = NULL, sortBy=c('expression', 'methylation', NA), scaledExpression = FALSE, labelPrefix.expression.other = '', 
	showAllTx = TRUE, useBetaValue = TRUE, includeGeneBody = FALSE, CpGInfo = NULL, genomicFeature = NULL,
	phenoColor = list(gradient=c("green", "black", "red")), th = 0.99, title.suffix = NULL, addLegend = TRUE,
	methylationLegendTitle = NULL, expressionLegendTitle = "Expression\n(log2-RPKM)", 
	gradient = c("blue", "white", "red"), ncolor = 16, main = NULL, newPlot = TRUE, selSample = NULL, ...)
}
\arguments{
  \item{selGene}{
a vector of EntrezIDs or a list of gene2tx
}
  \item{methyGenoSet}{
a GenoSet object for methylation data
}
  \item{gene2tx}{
a gene to transcript mapping list, used for retrieving expression.tx data
}
  \item{expression.tx}{
an ExpressionSet or data matrix for transcript expression
}
  \item{expression.other}{
an ExpressionSet or data matrix for other types of expression, whose dimnames matches expression.tx
}
  \item{phenoData}{
a data.frame for phenoData information
}
  \item{sortBy}{
whether to sort samples based on the mean of expression profiles, methylation cluster or NA (no sorting)
}
  \item{scaledExpression}{
whether to scale the expression values based on maximum expression (to the range of 0 to 1)
}
  \item{labelPrefix.expression.other}{
the labelPrefix for the "expression.other" colnames
}
  \item{showAllTx}{
whether to show all transcript in gene2tx or just those provided in selGene
}
  \item{useBetaValue}{
whether to use methylation Beta-value in the plot. 
}
  \item{includeGeneBody}{
if FALSE, then only shows the promoter region
}
  \item{CpGInfo}{
a bed file or GRanges for CpG island information
}
  \item{genomicFeature}{
used by buildAnnotationTracks function
}
  \item{phenoColor}{
a list of colors corresponding to phenoData
}
  \item{th}{
the quantile threshold used to remove outlier, which affects the plot color ranges.
}
  \item{title.suffix}{
a string attached to the end of the title
}
  \item{addLegend}{
whether to add a legend or not
}
  \item{methylationLegendTitle}{
title for methylation colorbar legend
}
  \item{expressionLegendTitle}{
title for expression colorbar legend
}
  \item{gradient}{
the gradient color to show the DataTrack
}
  \item{ncolor}{
the number of color levels
}
  \item{main}{
title of the plot. If it is null, then the Gene Symbol will be the plot title
}
  \item{newPlot}{
whether to create a new plot or add it to previous plot
}
  \item{selSample}{
subset of samples for plotting. It is designed for BigMatrix, which have to extract the data at the last moment.
}
  \item{\dots}{
other parameters used by heatmapByChromosome
}
}
\details{
Function, plotMethylationHeatmapByGene, is specifically designed for the methylation data. It plots one gene or genomic range each time. Users can add phenotypes or matched gene expression data to the right panel of the plot. Figure legends can be also added. By default, the plotMethylationHeatmapByGene plots methylation Beta-values (in the range of 0 to 1) instead of M-values. Users can set useBetaValue as FALSE if they want to change to M-values.
}
\value{
returns the grid viewport information

}

\author{
Pan Du
}

\seealso{
See also \code{\link{heatmapByChromosome}}
}
\examples{

data('exampleMethyGenoSet') 
if (require(TxDb.Hsapiens.UCSC.hg19.knownGene)) {
  genomicFeature <- 'TxDb.Hsapiens.UCSC.hg19.knownGene'
  selGene <- '1826'
  plotMethylationHeatmapByGene(selGene, methyGenoSet=exampleMethyGenoSet, phenoData=colData(exampleMethyGenoSet), genomicFeature=genomicFeature)

  ## use different color map for expression data
  es.example <- matrix(runif(ncol(exampleMethyGenoSet), max=10), nrow=1)
  rownames(es.example) <- selGene
  colnames(es.example) <- colnames(exampleMethyGenoSet)
  plotMethylationHeatmapByGene(selGene, methyGenoSet=exampleMethyGenoSet, expression.tx=es.example, genomicFeature=genomicFeature, phenoColor=list(gradient=c("green", "black", "red")))
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{methods}
\keyword{hplot}
