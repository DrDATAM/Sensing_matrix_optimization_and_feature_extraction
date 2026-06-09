# Sensing Matrix Optimization and Feature Extraction for Image Processing

This repository serves as the central hub for the dissertation and LaTeX package of my Ph.D. thesis completed at the **Indian Institute of Technology Delhi (IIT Delhi)** in 2022[cite: 1]. 

The individual algorithmic frameworks and experimental code developed throughout this research are hosted across separate dedicated repositories linked below[cite: 1].

---

## Abstract

At the heart of many pattern recognition and computer vision applications is the question of how to represent and recover data. Representing data in a manner which highlights its key properties can significantly affect the performance of pattern recognition and computer vision applications. Many approaches have been proposed for representing and recovering the high-dimensional data which tend to reside in low-dimensional intrinsic subspaces. Recently, there has been much research in optimally selecting informative samples from high-dimensional data via sensing matrix using compressed sensing. Compressed sensing allows us to exploit the sparse structure of the underlying phenomena for capturing incoherent measurements using a sensing matrix and then recovering the high-dimensional data. However, the sparse signal structure is not the only key aspect of compressed sensing; a robust incoherent frame structure to be used for the measurements is equally important. 

In this thesis, we address the problem of reconstructing high-dimensional data (such as images) in the presence of noise using measurements via incoherent sensing matrix for data compression. We propose an incoherent and robust sensing matrix design based on an equiangular tight frame to ensure reduced pairwise correlation among the frame vectors and tightness of the frame. Experiments are performed on synthetic data as well as real images. The performance evaluation is carried out in terms of mutual coherence, signal reconstruction accuracy, and peak signal-to-noise ratio. In addition, it is observed that the high dimensional data samples widely used in computer vision and pattern recognition tasks may contain irrelevant and redundant features. This can result in increased computational complexity, memory requirements, as well as the possibility of overfitting which can greatly weaken the inherent structural relationship between features degrading the overall performance. Thus, finding compact low-dimensional representation and features with good generalization and discriminative abilities is very important. 

In this thesis we address these issues to develop feature extraction models for image classification. Firstly, we present a representation-based supervised feature extraction model exploring the underlying global and local structure of the high-dimensional data. Next, we propose a regression-based feature extraction model to address the problem of insufficient inter-class margin and loss of the manifold structure of the data. To ensure the relative significance of the extracted features, an $\ell_{2,1}$-norm based regularization is employed. Performance of the proposed models is evaluated on various data sets for face, scene, and object recognition. The results achieved are compared with state-of-the-art methods to validate the effectiveness of the proposed models.

---

## Core Research Modules & Code Repositories

The major algorithmic contributions of this dissertation are organized across specialized open-source repositories[cite: 1]:

### 1. Sensing Matrix Optimization
ISMD Framework: Algorithms for Incoherent Sensing Matrix Design via alternating optimization techniques (Chapter 3)[cite: 1].
**IR-PMD & IFD Frameworks:** Implementation of Incoherent and Robust Projection Matrix Design alongside Incoherent Frame Design methods (Chapter 4)[cite: 1].

[Access the IR-PMD Repository](https://github.com/DrDATAM/IR-PMD)

### 2. Feature Extraction & Subspace Learning
**LADSL Framework:** Low-Rank and Analysis Dictionary Sparse Learning algorithms for feature extraction (Chapter 5)[cite: 1].

[Access the LADSL Repository](https://github.com/DrDATAM/Locality-aware-discriminative-subspace-learning)

**LR-DRR & TRLSR Frameworks:** Software for Low-Rank Double Relaxed Regression and Total Relaxed Least Squares Regression (Chapter 6)[cite: 1].
 
[Access the LR-DRR/TRLSR Repository](https://github.com/DrDATAM/TRLSR)

---

**LaTeX Source Packaging:** The uncompiled source `.tex` files, bibliographies, and document structures are located within the `/latex-source` directory of this branch.

---

## Citation

If you find the frameworks, text, or methodologies useful in your academic research, please cite the dissertation using the following entry[cite: 1]:

```bibtex
@phdthesis{meenakshi2022sensing,
  author       = {Meenakshi},
  title        = {Sensing Matrix Optimization and Feature Extraction for Image Processing},
  school       = {Indian Institute of Technology Delhi},
  year         = {2022},
  month        = {October},
  address      = {New Delhi, India}
}