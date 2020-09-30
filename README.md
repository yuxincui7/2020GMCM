# 2020GMCM
2020 "Huawei Cup" 17th China Post-Graduate Mathematical Contest in Modeling
> 2020 "华为杯"第十七届中国研究生数学建模竞赛

本项目包含:

B: B题"汽油辛烷值建模"的全部代码，包括数据处理、寻找主要建模变量、建立辛烷值损失预测模型、主要操作变量优化、模型可视化展示五个部分。
## 目录

- [安装](#安装)
- [题目](#题目)
- [使用](#使用)
- [致谢](#致谢)

## 安装

安装脚本在'/B/env'文件夹中，逐行运行'build_env_tf22_py38.sh'即可。

```sh
$ ./build_env_tf22_py38.sh
```

## 题目
1. 数据处理：请参考近4年的工业数据(见附件一“325个数据样本数据.xlsx”)的预处理结果，依“样本确定方法”（附件二）对285号和313号数据样本进行预处理（原始数据见附件三“285号和313号样本原始数据.xlsx”）并将处理后的数据分别加入到附件一中相应的样本号中，供下面研究使用。

2. 寻找建模主要变量：
由于催化裂化汽油精制过程是连续的，虽然操作变量每3 分钟就采样一次，但辛烷值（因变量）的测量比较麻烦，一周仅2次无法对应。但根据实际情况可以认为辛烷值的测量值是测量时刻前两小时内操作变量的综合效果，因此预处理中取操作变量两小时内的平均值与辛烷值的测量值对应。这样产生了325个样本（见附件一）。
建立降低辛烷值损失模型涉及包括7个原料性质、2个待生吸附剂性质、2个再生吸附剂性质、2个产品性质等变量以及另外354个操作变量（共计367个变量），工程技术应用中经常使用先降维后建模的方法，这有利于忽略次要因素，发现并分析影响模型的主要变量与因素。因此，请你们根据提供的325个样本数据（见附件一），通过降维的方法从367个操作变量中筛选出建模主要变量，使之尽可能具有代表性、独立性（为了工程应用方便，建议降维后的主要变量在30个以下），并请详细说明建模主要变量的筛选过程及其合理性。（提示：请考虑将原料的辛烷值作为建模变量之一）。

3. 建立辛烷值（RON）损失预测模型：采用上述样本和建模主要变量，通过数据挖掘技术建立辛烷值（RON）损失预测模型，并进行模型验证。 

4. 主要变量操作方案的优化：要求在保证产品硫含量不大于5μg/g的前提下，利用你们的模型获得325个数据样本(见附件四“325个数据样本数据.xlsx”)中，辛烷值（RON）损失降幅大于30%的样本对应的主要变量优化后的操作条件（优化过程中原料、待生吸附剂、再生吸附剂的性质保持不变，以它们在样本中的数据为准）。

5. 模型的可视化展示：工业装置为了平稳生产，优化后的主要操作变量（即：问题2中的主要变量）往往只能逐步调整到位，请你们对133号样本（原料性质、待生吸附剂和再生吸附剂的性质数据保持不变，以样本中的数据为准），以图形展示其主要操作变量优化调整过程中对应的汽油辛烷值和硫含量的变化轨迹。（各主要操作变量每次允许调整幅度值Δ见附件四“354个操作变量信息.xlsx”）。

##使用
1. 对于285号和313号样本的预处理，运行代码'data_preprocess_0.ipynb';对于问题一中的前三步处理，运行代码'data_preprocess_123.ipynb';对于问题一中的第四步和第五步处理，运行代码'data_preprocess_45.ipynb'。运行代码'range_preprocess.ipynb'保存每一个操作变量的范围。

2. 运行代码'feature_reduce.ipynb'通过方差选择法和相关系数选择法减少操作变量个数，在此基础上，运行代码'feature_select_cv_pearson.ipynb'分别通过变异系数和皮尔森系数选择出30个操作变量，运行代码'feature_select_rf_cat.ipynb'分别通过随机森林和Catboost选择出30个操作变量，运行代码'feature_select_PCA.ipynb'通过PCA选择出30个主成分。

3. 运行'model_select_single_output.ipynb',可以测试第二步中选择出的主要操作变量在不同模型上预测'Product_RON_loss'的误差。

4. 代码'feature_select_rf_multi.ipynb'表示在预测多标签（'Product_RON_loss', 'Product_S_content', 'Product_RON'）情况下，采用随机森林筛选出来的30个主要操作变量。

5. 代码'multi_output_model_select.ipynb'在预测多标签情况下，选择了一种MSE最小的模型，为Ridge；代码'multi_output_testset_generate.ipynb'通过1中的操作变量的取值范围以及Δ值生成了测试的数据，代码'model_visualization.ipynb'通过生成的测试数据来预测'Product_RON_loss', 'Product_S_content'，'Product_RON'，并可视化。


## 致谢

万分感谢付碧阳同学在准备面试的同时还为我们送饭，以及感谢我们三个人的坚持。其中，阿胡负责论文撰写，郑雷和阿崔负责代码编程。不得不说整个过程都很快乐，希望以后也能有此机会，让平淡的生活变得充实。郑雷之前数次想参加数学建模，结果都被人直接拒绝了，因此这次的数学建模也算完成了他的心愿；而阿崔之前也参加过几次数学建模，第一次因为忘记了缴费没能成功参赛，第二次因为其中一个队友出去旅游所以没能完成建模，终于在第三次参加成功提交论文，可以说是好事多磨吧；听一个拿到国二的同学说，只要提交论文就能拿奖，若果真如此，那么阿胡从本科以来拿奖的愿望亦能实现。愿我们四个都能在上海重逢，都有光明的前途。"何当共剪西窗烛，却话巴山夜雨时"，何时才能再像现在这样，谈论数学建模的趣事呢？
