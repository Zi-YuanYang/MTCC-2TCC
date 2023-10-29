# Multi-order Texture Features for Palmprint Recognition

This repository is a Matlab implementation of our 2TCC and MTCC (accepted by Artificial Intelligence Review)

[Paper Link](https://link.springer.com/article/10.1007/s10462-022-10194-5)

#### Abstract
Palmprint attracts increasing attention thanks to its several advantages. 1st-order textures have been widely used for palmprint recognition; unfortunately, high-order textures, although they are also discriminative, were ignored in the existing works. 2nd-order textures are first employed for palmprint recognition in this paper. 1st-order textures are convolved with the filters to extract 2nd-order textures that can refine the texture information and improve the contrast of the feature map. Then 2nd-order textures are used to generate 2nd-order Texture Co-occurrence Code (2TCC). The sufficient experiments demonstrate that 2TCC yields satisfactory accuracy performance on four public databases, including contact, contactless and multi-spectral acquisition types. Moreover, in order to further improve the discrimination and robustness of 2TCC, we propose Multiple-order Texture Co-occurrence Code (MTCC), in which 1st-order Texture Co-occurrence Code (1TCC) and 2TCC are fused at score level. 1TCC is good at describing minor wrinkles; while 2TCC does well in describing principal textures. Thus the combination of both can describe the palmprint features more comprehensively. MTCC achieves remarkable accuracy performance when compared with the state-of-the-art methods on all public databases.

#### Some tips
Our code can be easily modifed to other coding-based methods, such as PalmCode, BOCV, CompCode, etc.

#### Acknowledgments
Thanks to my all cooperators, they contributed so much to this work. Besides, maybe you could try our other palmprint recognition methods, such as [CO3Net](https://github.com/Zi-YuanYang/CO3Net) and [CCNet](https://github.com/Zi-YuanYang/CCNet).

#### Citation
If our work is valuable to you, please cite our work:
```
@article{yang2022mtcc,
  title={Multi-order Texture Features for Palmprint Recognition},
  author={Yang, Ziyuan and Leng, Lu and Wu, Tengfei and Li, Ming and Chu, Jun},
  journal={Artificial Intelligence Review},
  year={2022},
  publisher={Springer}
}
```
