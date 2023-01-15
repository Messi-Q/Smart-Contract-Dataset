# Smart Contract Dataset

**This repository aims at releasing the smart contract datasets used in our works. Furthermore, we also present instructions on how to label a certain type of vulnerability and show the detailed pattern designs of investigated vulnerabilities.**


## Resource 1

- This dataset consists of over 40K real world Ethereum smart contracts. 
- Download this resource at [Ethereum_smart_contract](https://drive.google.com/file/d/1yFJSCiUuoiSx4uWYNcCESUvsEs5DOGM9/view?usp=sharing). 

- Please cite one of our papers if you want to use this dataset in your paper:
```
@inproceedings{zhuangsmart,
  title={Smart Contract Vulnerability Detection using Graph Neural Network},
  author={Zhuang, Yuan and Liu, Zhenguang and Qian, Peng and Liu, Qi and Wang, Xiang and He, Qinming},
  booktitle={IJCAI},
  pages={3283--3290},
  year={2020}
}

@inproceedings{liu2021smart,
  title={Smart Contract Vulnerability Detection: From Pure Neural Network to Interpretable Graph Feature and Expert Pattern Fusion},
  author={Liu, Zhenguang and Qian, Peng and Wang, Xiang and Zhu, Lei and He, Qinming and Ji, Shouling},
   booktitle={IJCAI},
  pages={2751--2759},
  year={2021}
}

@article{liu2021combining,
  title={Combining Graph Neural Networks with Expert Knowledge for Smart Contract Vulnerability Detection},
  author={Liu, Zhenguang and Qian, Peng and Wang, Xiaoyang and Zhuang, Yuan and Qiu, Lin and Wang, Xun},
  journal={IEEE Transactions on Knowledge and Data Engineering},
  year={2021},
  publisher={IEEE}
}
``` 

## Resource 2
- This dataset concerns four types of vulnerabilities (i.e., reentrancy, timestamp dependency, integer overflow, dangerous delegatecall), where we give the preprocessing method. 
- Check [instructions](https://github.com/Messi-Q/Smart-Contract-Dataset/tree/master/instructions) for how to label these vulnerabilities.
- Download this resource at [Dataset_preprocessing](https://drive.google.com/file/d/1UhHHevE9iDmvSB_k_lhyI58KAj7hnB1o/view?usp=share_link). 



## Resource 3
- This dataset contains over 12K Ethereum smart contracts and concerns eight types of vulnerabilities. 
- Check the [pattern](https://github.com/Messi-Q/Smart-Contract-Dataset/tree/master/patterns) design for more details.
- Download this resource at [Dataset](https://drive.google.com/file/d/1iU2J-BIstCa3ooVhXu-GljOBzWi9gVrG/view?usp=share_link). 

- Please cite our paper if you want to use this dataset in your paper:
```
@article{liu2023rethinking,
  title={Rethinking Smart Contract Fuzzing: Fuzzing With Invocation Ordering and Important Branch Revisiting},
  author={Liu, Zhenguang and Qian, Peng and Yang, Jiaxu and Liu, Lingfeng and Xu, Xiaojun and He, Qinming and Zhang, Xiaosong},
  journal={arXiv preprint arXiv:2301.03943},
  year={2023}
}
```

