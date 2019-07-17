#!/usr/bin/env Rscript

library(rmarkdown)
library(optparse)

option_list = list(
  make_option(c("-r", "--report"), type="character", default=NULL, help="report template file", metavar="character"),
  make_option(c("-o", "--output"), type="character", default="RNAseq_report.html", help="output file name", metavar="character"),
  make_option(c("-s", "--proj_summary"), type="character", default=NULL, help="project summary file", metavar="character"),
  make_option(c("-v", "--versions"), type="character", default=NULL, help="versions file", metavar="character"),
  make_option(c("-m", "--model"), type="character", default=NULL, help="linear model file", metavar="character"),
  make_option(c("-c", "--config"), type="character", default=NULL, help="report config file", metavar="character"),
  make_option(c("-k", "--contrast"), type="character", default=NULL, help="contrasts file", metavar="character")
)

opt_parser = OptionParser(option_list=option_list)
opt = parse_args(opt_parser)

wd=getwd()

rmarkdown::render(opt$report, output_file = opt$output, knit_root_dir = wd, output_dir = wd,
                  params = list(path_proj_summary = opt$proj_summary,
                                path_versions = opt$versions,
                                path_design = opt$model,
                                path_config = opt$config,
                                path_contrast = opt$contrast,
                                path_wd = wd))