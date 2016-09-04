# Byte Cup 2016
# http://biendata.com/competition/bytecup2016/
#
# Created at Sep. 1, 2016
###

### Introduction
## Tasks:
#     参赛队伍利用给定的头条问答数据（包括专家标签、问题数据以及问题分发数据，详见数据描述部分），进
# 行针对问题的专家挖掘。
#     给定若干问题，参赛者需要预测哪些专家更有可能回答这些问题。具体的，针对每个问题和一位候选专家，
# 参赛者需要根据计算该专家回答问题的概率。实际运营中，系统会优先向回答概率高的候选专家发送这个问题的
# 回答邀请，直到收到的回答数量达到指定阈值。评估方面，给定一个问题，我们会按照预测概率把候选专家排序
# ，并分别评估排序结果的NDCG@5，NDCG@10最后评分公式为 NDCG@5 * 0.5 + NDCG@10 * 0.5
###

### Step 1. Load data
library(readr)
library(dplyr)
library(ggplot2)

user_info <- read.table(file = "data/user_info.txt", header = F, sep = "\t")
colnames(user_info) <- c("uid", "label", "wordID", "charID")

question_info <- read.table(file = "data/question_info.txt", header = F, sep = "\t")
colnames(question_info) <- c("qid", "label", "wordID", "charID", "good", "count", "topGrade")

invited_info_train <- read.table(file = "data/invited_info_train_new.txt", header = F, sep = "\t")
colnames(invited_info_train) <- c("qid", "uid", "flag")

validate_nolabel <- read.table(file = "data/validate_nolabel.txt", header = F, sep = ",")
colnames(validate_nolabel) <- c("qid", "uid")

### To be added after Nov. 11
# invited_info_validate
# invited_info_test

###
