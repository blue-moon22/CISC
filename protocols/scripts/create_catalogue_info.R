#!/usr/bin/env Rscript

# Check if two arguments
args = commandArgs(trailingOnly=TRUE)
if (length(args) != 3) {
  stop("Usage: Rscript create_cataloge_info.R <file with list of headers> <directory with insertion sequences info txt file> <output tab-delimited info file>", call.=FALSE)
}

# Load libraries
library(dplyr)

# Combine info
is_names <- read.delim(args[1], header = FALSE, stringsAsFactors = FALSE)
is_names <- is_names$V1[!grepl("__", is_names$V1)]

info_files <- list.files(paste0(args[2], "/"), pattern = "*_insertion_sequences_info.txt", full.names = TRUE)
is_info <- data.frame()
for (i in 1:length(info_files)) {
  info = file.info(info_files[i])
  if (info$size != 0) {
    tmp <- read.delim(info_files[i], header = TRUE, stringsAsFactors = FALSE)
    is_info <- rbind(is_info, tmp)
  }
}

# Remove duplicates
is_info <- is_info[is_info$IS_name %in% is_names,]
is_info <- is_info %>% select(-itr_cluster)
is_info <- is_info[!duplicated(is_info$IS_name),]

# Clean info
is_info$offset <- is_info$itr1_start_position - 1
is_info$itr1_start_pos <- is_info$itr1_start_position - is_info$offset
is_info$itr1_end_pos <- is_info$itr1_end_position - is_info$offset
is_info$itr2_start_pos <- is_info$itr2_start_position - is_info$offset
is_info$itr2_end_pos <- is_info$itr2_end_position - is_info$offset

is_catalog_info <- is_info %>% 
  select(IS_name, itr1_start_pos, itr1_end_pos, itr2_start_pos, itr2_end_pos, 
         ISfinder_name, ISfinder_origin, predicted_IS_family, 
         COB_index_biosample_id, COB_index_origin)

write.table(is_catalog_info, args[3], sep = '\t', row.names = FALSE, quote = FALSE)