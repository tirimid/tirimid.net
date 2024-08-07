---
layout: default
title: Unnamic
date_published: 2024-07-02
date_latest_revision: 2024-07-04
author: tirimid
---


# Introduction

This is a conlang project. My rough "goal" in creating this is to make a more
phonologically and morphologically complex constructed language than I've done
in the past, and translate some things into it. This is mainly so that I have an
excuse to experiment with interesting (and maybe some unfamiliar) linguistic
features.

The name "Unnamic" is derived from the word "unnamed"; modified with the "-ic"
suffix and Proper-Noun'd with a capital "U". "Unnamic" is the English name for
the language, i.e. an exonym, and not the native name for it.

This page will serve as the official documentation for my conlang.

# Phonology

## Phoneme inventory

The consonant inventory is as follows:

| *-*         | *Bilabial* | *Dental* | *Alveolar* | *Retroflex* | *Palatal* | *Velar* | *Uvular* |
|-------------|------------|----------|------------|-------------|-----------|---------|----------|
| *Nasal*     | m          | -        | n          | -           | -         | -       | -        |
| *Plosive*   | p b        | -        | t d        | -           | -         | k ɡ     | q ɢ      |
| *Fricative* | ɸ β        | θ ð      | s z        | ʂ ʐ         | ɕ ʑ       | x ɣ     | -        |
| *Tap*       | -          | -        | ɾ          | -           | -         | -       | -        |
| *Trill*     | -          | -        | r          | -           | -         | -       | -        |

The vowel inventory is as follows:

| *-*         | *Front* | *Center* | *Back* |
|-------------|---------|----------|--------|
| *Close*     | i y     | ɨ        | ɯ u    |
| *Close-mid* | e ø     | ə        | o      |
| *Open-mid*  | ɛ       | -        | ʌ      |

## Phonotactics

The legal structure for a syllable is C(C)V(C)(C)(C). In words with multiple
syllables, the syllables that have coda consonants are separated by /ə/ sounds.
Thus, in practice, the word will have more syllables than I'll analyze it as
having. This is done in order to reduce the possibility of words containing
illegal consonant clusters.

For example, take a word made of the syllables /min/ and /zde/. When combined,
it would become /minəzde/, for which I will transcribe the syllable boundaries
as /'minə.zde/, even though a syllable will traditionally never have a vowel
after its coda consonants.

### Legal consonant clusters

Legal consonant clusters are judged against all consonant pairs in a cluster.
That is, a syllable with the structure CVCCC has a consonant triple at the end
rather than a pair. This triple will be evaluated for its validity in pairs,
i.e. CV[CC]C and CVC[CC] must both be valid.

The legality of a consonant cluster only matters in 0th transformation (read on
to find out what that is). So, if a syllable consisting of legal consonant
clusters begins containing illegal clusters in 1st, 2nd, etc. transformation,
this is not a problem. But, if a syllable contains illegal consonant clusters in
0th transformation, this is not allowed, and the syllable is considered
nonconforming to the rules of the language.

The following consonant pairs are valid within clusters:

| *-* | *m* | *n* | *p* | *b* | *t* | *d* | *k* | *ɡ* | *q* | *ɢ* | *ɸ* | *β* | *θ* | *ð* | *s* | *z* | *ʂ* | *ʐ* | *ɕ* | *ʑ* | *x* | *ɣ* | *ɾ* | *r* |
|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
| *m* | -   | mn  | mp  | mb  | mt  | md  | mk  | mɡ  | mq  | mɢ  | -   | -   | mθ  | mð  | ms  | mz  | mʂ  | mʐ  | mɕ  | mʑ  | mx  | mɣ  | mɾ  | mr  |
| *n* | nm  | -   | np  | nb  | nt  | nd  | nk  | nɡ  | nq  | nɢ  | -   | -   | nθ  | nð  | ns  | nz  | nʂ  | nʐ  | nɕ  | nʑ  | nx  | nɣ  | nɾ  | nr  |
| *p* | pm  | pn  | -   | -   | pt  | pd  | pk  | pɡ  | pq  | pɢ  | pɸ  | pβ  | pθ  | pð  | ps  | pz  | pʂ  | pʐ  | pɕ  | pʑ  | px  | pɣ  | pɾ  | pr  |
| *b* | bm  | bm  | -   | -   | bt  | bd  | bk  | bɡ  | bq  | bɢ  | bɸ  | bβ  | bθ  | bð  | bs  | bz  | bʂ  | bʐ  | bɕ  | bʑ  | bx  | bɣ  | bɾ  | br  |
| *t* | tm  | tn  | tp  | tb  | -   | -   | tk  | tɡ  | tq  | tɢ  | tɸ  | tβ  | tθ  | tð  | ts  | tz  | tʂ  | tʐ  | tɕ  | tʑ  | tx  | tɣ  | tɾ  | tr  |
| *d* | dm  | dn  | dp  | db  | -   | -   | dk  | dɡ  | dq  | dɢ  | dɸ  | dβ  | dθ  | dð  | ds  | dz  | dʂ  | dʐ  | dɕ  | dʑ  | dx  | dɣ  | dɾ  | dr  |
| *k* | km  | kn  | kp  | kb  | kt  | kd  | -   | -   | -   | -   | kɸ  | kβ  | kθ  | kð  | ks  | kz  | kʂ  | kʐ  | kɕ  | kʑ  | kx  | kɣ  | kɾ  | kr  |
| *ɡ* | ɡm  | ɡn  | ɡp  | ɡb  | ɡt  | ɡd  | -   | -   | -   | -   | ɡɸ  | ɡβ  | ɡθ  | ɡð  | ɡs  | ɡz  | ɡʂ  | ɡʐ  | ɡɕ  | ɡʑ  | ɡx  | ɡɣ  | ɡɾ  | ɡr  |
| *q* | qm  | qn  | qp  | qb  | qt  | qd  | -   | -   | -   | -   | qɸ  | qβ  | qθ  | qð  | qs  | qz  | qʂ  | qʐ  | qɕ  | qʑ  | qx  | qɣ  | qɾ  | qr  |
| *ɢ* | ɢm  | ɢn  | ɢp  | ɢb  | ɢt  | ɢd  | -   | -   | -   | -   | ɢɸ  | ɢβ  | ɢθ  | ɢð  | ɢs  | ɢz  | ɢʂ  | ɢʐ  | ɢɕ  | ɢʑ  | ɢx  | ɢɣ  | ɢɾ  | ɢr  |
| *ɸ* | ɸm  | ɸn  | ɸp  | ɸb  | ɸt  | ɸd  | ɸk  | ɸɡ  | ɸq  | ɸɢ  | -   | -   | -   | -   | ɸs  | -   | ɸʂ  | -   | ɸɕ  | -   | ɸx  | ɸɣ  | ɸɾ  | ɸr  |
| *β* | βm  | βn  | βp  | βb  | βt  | βd  | βk  | βɡ  | βq  | βɢ  | -   | -   | -   | -   | βs  | βz  | βʂ  | βʐ  | βɕ  | βʑ  | βx  | βɣ  | βɾ  | βr  |
| *θ* | θm  | θn  | θp  | θb  | θt  | θd  | θk  | θɡ  | θq  | θɢ  | θɸ  | θβ  | -   | -   | θs  | θz  | θʂ  | θʐ  | θɕ  | θʑ  | θx  | θɣ  | θɾ  | θr  |
| *ð* | ðm  | ðn  | ðp  | ðb  | ðt  | ðd  | ðk  | ðɡ  | ðq  | ðɢ  | -   | ðβ  | -   | -   | ðs  | ðz  | ðʂ  | ðʐ  | ðɕ  | ðʑ  | ðx  | ðɣ  | ðɾ  | ðr  |
| *s* | sm  | sn  | sp  | sb  | st  | sd  | sk  | sɡ  | sq  | sɢ  | sɸ  | sβ  | sθ  | sð  | -   | -   | sʂ  | sʐ  | sɕ  | sʑ  | sx  | sɣ  | sɾ  | sr  |
| *z* | zm  | zn  | zp  | zb  | zt  | zd  | zk  | zɡ  | zq  | zɢ  | zɸ  | zβ  | zθ  | zð  | -   | -   | zʂ  | zʐ  | zɕ  | zʑ  | zx  | zɣ  | zɾ  | zr  |
| *ʂ* | ʂm  | ʂn  | ʂp  | ʂb  | ʂt  | ʂd  | ʂk  | ʂɡ  | ʂq  | ʂɢ  | ʂɸ  | ʂβ  | ʂθ  | ʂð  | ʂs  | ʂz  | -   | -   | -   | -   | ʂx  | ʂɣ  | ʂɾ  | ʂr  |
| *ʐ* | ʐm  | ʐn  | ʐp  | ʐb  | ʐt  | ʐd  | ʐk  | ʐɡ  | ʐq  | ʐɢ  | ʐɸ  | ʐβ  | ʐθ  | ʐð  | ʐs  | ʐz  | -   | -   | -   | -   | ʐx  | ʐɣ  | ʐɾ  | ʐr  |
| *ɕ* | ɕm  | ɕn  | ɕp  | ɕb  | ɕt  | ɕd  | ɕk  | ɕɡ  | ɕq  | ɕɢ  | ɕɸ  | ɕβ  | ɕθ  | ɕð  | ɕs  | ɕz  | -   | -   | -   | -   | ɕx  | ɕɣ  | ɕɾ  | ɕr  |
| *ʑ* | ʑm  | ʑn  | ʑp  | ʑb  | ʑt  | ʑd  | ʑk  | ʑɡ  | ʑq  | ʑɢ  | ʑɸ  | ʑβ  | ʑθ  | ʑð  | ʑs  | ʑz  | -   | -   | -   | -   | ʑx  | ʑɣ  | ʑɾ  | ʑr  |
| *x* | xm  | xn  | xp  | xb  | xt  | xd  | xk  | xɡ  | xq  | xɢ  | xɸ  | xβ  | xθ  | xð  | xs  | xz  | xʂ  | xʐ  | xɕ  | xʑ  | -   | -   | xɾ  | xr  |
| *ɣ* | ɣm  | ɣn  | ɣp  | ɣb  | ɣt  | ɣd  | ɣk  | ɣɡ  | ɣq  | ɣɢ  | ɣɸ  | ɣβ  | ɣθ  | ɣð  | ɣs  | ɣz  | ɣʂ  | ɣʐ  | ɣɕ  | ɣʑ  | -   | -   | ɣɾ  | ɣr  |
| *ɾ* | ɾm  | ɾn  | ɾp  | ɾb  | ɾt  | ɾd  | ɾk  | ɾɡ  | ɾq  | ɾɢ  | ɾɸ  | ɾβ  | ɾθ  | ɾð  | ɾs  | ɾz  | ɾʂ  | ɾʐ  | ɾɕ  | ɾʑ  | ɾx  | ɾɣ  | -   | -   |
| *r* | rm  | rn  | rp  | rb  | rt  | rd  | rk  | rɡ  | rq  | rɢ  | rɸ  | rβ  | rθ  | rð  | rs  | rz  | rʂ  | rʐ  | rɕ  | rʑ  | rx  | rɣ  | -   | -   |

### Legal syllable-position consonants

The legality of 0th transformation consonants / consonant clusters is limited
further, by the position of the cluster in the syllable. The initial consonant
of a consonant cluster (including single-consonant "clusters") determines which
positions the cluster may take within a syllable. I.e., some consonant clusters
are legal in the coda but not the onset of a syllable, and vice versa - somewhat
like how the consonant "-ng" in English cannot be used in the onset of a
syllable.

See the table below:

| *Cluster-initial consonant* | *Legal in onset?* | *Legal in coda?* |
|-----------------------------|-------------------|------------------|
| m                           | No                | Yes              |
| n                           | No                | Yes              |
| p                           | Yes               | Yes              |
| b                           | Yes               | Yes              |
| t                           | Yes               | Yes              |
| d                           | Yes               | Yes              |
| k                           | Yes               | Yes              |
| ɡ                           | Yes               | Yes              |
| q                           | Yes               | No               |
| ɢ                           | Yes               | No               |
| ɸ                           | Yes               | No               |
| β                           | Yes               | No               |
| θ                           | Yes               | Yes              |
| ð                           | Yes               | Yes              |
| s                           | Yes               | Yes              |
| z                           | Yes               | Yes              |
| ʂ                           | Yes               | Yes              |
| ʐ                           | No                | Yes              |
| ɕ                           | Yes               | Yes              |
| ʑ                           | No                | Yes              |
| x                           | Yes               | Yes              |
| ɣ                           | Yes               | No               |
| ɾ                           | No                | Yes              |
| r                           | No                | Yes              |

This means that a word like /'kɾɛʐə.βne/ would be legal, but /'ʐɾɛkə.neβ/ would
not.

### Phonemic transformations

Phonemic transformations are sequences of changes applied to phonemes in order
to indicate some sort of morphological difference. This is one of the things I
wanted to try out with the conlang, so it is core to how it works. As such, it
is necessary that I define a few termins to describe what kind of
transformations the Unnamic language uses.

First, the simplest: "V-transformations". V-transformations apply to individual
vowel phonemes, and there are only two possible transformations for a vowel.
Those two transformations are V-0 and V-1. V-0 is the 0th transformation (i.e.
the "basic", untransformed form of the vowel) and V-1 is the transformed form.

As always, a table is worth a hundred million or so words, so here is the
relationship between vowels, their V-0 forms, and their V-1 forms.

| *Vowel* | *V-0 form* | *V-1 form* |
|---------|------------|------------|
| i       | i          | y          |
| y       | y          | i          |
| ɨ       | ɨ          | o          |
| ɯ       | ɯ          | u          |
| u       | u          | ɯ          |
| e       | e          | ø          |
| ø       | ø          | e          |
| ə       | ə          | -          |
| o       | o          | ɨ          |
| ɛ       | ɛ          | ʌ          |
| ʌ       | ʌ          | ɛ          |

As you can see, different vowels map to each other; being each others' V-1
forms. When a vowel has an alternate rounded/unrounded form, its V-1 is the that
form. The only exception is the /ə/, as it has no morphological use and is only
ever uttered as a syllable separator.

Second, "C-transformations". C-transformations apply to individual consonant
phonemes. For any given consonant phoneme, there are four transformational
forms: C-0 through C-3.

Here is the table for C-transformations:

| *Consonant* | *C-0 form* | *C-1 form* | *C-2 form* | *C-3 form* |
|-------------|------------|------------|------------|------------|
| m           | m          | mʲ         | n          | nʲ         |
| n           | n          | nʲ         | m          | mʲ         |
| p           | p          | pʲ         | b          | bʲ         |
| b           | b          | bʲ         | p          | pʲ         |
| t           | t          | tʲ         | d          | dʲ         |
| d           | d          | dʲ         | t          | tʲ         |
| k           | k          | kʲ         | ɡ          | ɡʲ         |
| ɡ           | ɡ          | ɡʲ         | k          | kʲ         |
| q           | q          | q          | ɢ          | ɢ          |
| ɢ           | ɢ          | ɢ          | q          | q          |
| ɸ           | ɸ          | ɸʲ         | β          | βʲ         |
| β           | β          | βʲ         | ɸ          | ɸʲ         |
| θ           | θ          | θʲ         | ð          | ðʲ         |
| ð           | ð          | ðʲ         | θ          | θʲ         |
| s           | s          | sʲ         | z          | zʲ         |
| z           | z          | zʲ         | s          | sʲ         |
| ʂ           | ʂ          | ʂ          | ʐ          | ʐ          |
| ʐ           | ʐ          | ʐ          | ʂ          | ʂ          |
| ɕ           | ɕ          | ɕ          | ʑ          | ʑ          |
| ʑ           | ʑ          | ʑ          | ɕ          | ɕ          |
| x           | x          | xʲ         | ɣ          | ɣʲ         |
| ɣ           | ɣ          | ɣʲ         | x          | xʲ         |
| ɾ           | ɾ          | ɾʲ         | r          | rʲ         |
| r           | r          | rʲ         | ɾ          | ɾʲ         |

The pattern is obvious. With few exceptions, going from C-0 to C-1 palatalizes
the consonant; going from C-1 to C-2 depalatalizes it and changes the
voicedness, and going from C-2 to C-3 repalatalizes it.

Third, we can put together V-transformations and C-transformations to get
"S-transformations". As you can probably guess, S-transformations apply to
entire syllables, and are actually just specific combinations of
C-transformations and V-transformations. S-transformational forms range from S-0
to S-7.

Here is a table describing this idea:

| *S-transformational form* | *Syllable structure* |
|---------------------------|----------------------|
| S-0                       | C-0* V-0 C-0*        |
| S-1                       | C-0* V-1 C-0*        |
| S-2                       | C-1* V-0 C-1*        |
| S-3                       | C-1* V-1 C-1*        |
| S-4                       | C-2* V-0 C-2*        |
| S-5                       | C-2* V-1 C-2*        |
| S-6                       | C-3* V-0 C-3*        |
| S-7                       | C-3* V-1 C-3*        |

To further elaborate: when transforming a syllable from S-0 to S-1, the vowel is
transformed from V-0 to V-1. When transforming from S-1 to S-2, the consonants
all change from C-0 to C-1 and the vowel changes back to V-0. When transforming
from S-2 to S-3, the vowel changes from V-0 to V-1. And so on...

To fully illustrate what this actually means in practice, take the following
example of all the S-transformational forms of the syllable /kɾɛβsʐ/:

| *Syllable form* | *Syllable* |
|-----------------|------------|
| S-0             | kɾɛβsʐ     |
| S-1             | kɾʌβsʐ     |
| S-2             | kʲɾʲɛβʲsʲʐ |
| S-3             | kʲɾʲʌβʲsʲʐ |
| S-4             | ɡrɛɸzʂ     |
| S-5             | ɡrʌɸzʂ     |
| S-6             | ɡʲrʲɛɸʲzʲʂ |
| S-7             | ɡʲrʲʌɸʲzʲʂ |

This is important because this idea of transformation will be used extensively
throughout the conlang. For shorthand, I will also say that "transforming" a
vowel / consonant / syllable / word (see next section) refers to incrementing
the degree of transformation (e.g. S-0 increments to S-1), and "detransforming"
it refers to decrementing the degree of transformation (e.g. S-1 decrements to
S-0).

As a special case, when an S-7 form is transformed, it wraps around to S-0. Same
for C-3, V1, etc. And when an S-0, C-0, ..., form is detransformed, it becomes
S-7, C-3, etc. Kind of like integer over/underflow behavior.

### Stress

Phonemic stress is indicated by increased emphasis on a syllable, such as
increased volume of speech, change in pitch, etc. Words each have a single
stressed syllable; and it is worth noting that the stressed syllable includes
the syllable separator in multi-syllable words. I.e., you'd also pronounce the
/ə/ with increased pitch, volume, whatever.

As I briefly mentioned in the previous section, stress is relevant to phonemic
transformations. Apart from V-, C-, and S-transformations, I define a
"W-transformation", or "word transformation". W-transformations define which
syllable the phonemic stress of a word falls on and are orthogonal to
S/C/V-transformations.

By default, words are in W-0 form. In W-0 form, stress falls on the first
syllable. In W-1 form, it falls on the second syllable. In W-2, on the third.
Thus, this is the simplest possible phonemic transformation.

# Romanization

In order to avoid having to write everything in IPA, it is necessary to define
some sort of Romanization system. The Unnamic Romanization has the following
three goals:

1. Map 1:1 to the IPA representation
2. Be ASCII-compatible
3. Not look *too* terrible

The easiest part is representing individual phonemes.

The consonants are represented as follows:

| *Phoneme* | *Representation* |
|-----------|------------------|
| m         | m                |
| n         | n                |
| p         | p                |
| b         | b                |
| t         | t                |
| d         | d                |
| k         | k                |
| ɡ         | g                |
| q         | q                |
| ɢ         | gg               |
| ɸ         | f                |
| β         | w                |
| θ         | th               |
| ð         | dh               |
| s         | s                |
| z         | z                |
| ʂ         | sz               |
| ʐ         | zh               |
| ɕ         | sc               |
| ʑ         | j                |
| x         | kh               |
| ɣ         | gh               |
| ɾ         | r                |
| r         | rr               |

And vowels are as follows:

| *Phoneme* | *Representation* |
|-----------|------------------|
| i         | i                |
| y         | eu               |
| ɨ         | y                |
| ɯ         | ue               |
| u         | u                |
| e         | ei               |
| ø         | oe               |
| ə         | e                |
| o         | o                |
| ɛ         | ae               |
| ʌ         | a                |

Words are written such that the first character of their first syllable is
capitalized, and all the syllables are separated by spaces. If any of the
syllables are in such an S-transformational form that contains palatalized
phonemes, the vowel of the word is prefixed with a "y". If the first syllable of
the word is stressed, then stress is not explicitly written; otherwise, the
stressed syllable is prefixed with a single quote (').

For example, the word /kɾɛʐə'βne.ɡʲrʲʌɸʲzʲʂ/ would be written as "Kraezhe 'wnei
grryafzsz". For a more comprehensive example of how stress and palatalization
interacts with the Romanization, see the following table:

*Word: Kraezhe wnei /kɾɛʐə.βne/*

| *-*                      | *Word unpalatalized* | *Word palatalized* |
|--------------------------|----------------------|--------------------|
| *Stress on 1st syllable* | Kraezhe wnei         | Kryaezhe wnyei     |
| *Stress on 2nd syllable* | Kraezhe 'wnei        | Kryaezhe 'wnyei    |

This system is certainly not perfect, but it's the best I've come up with, after
a few tries, that balances my goals for the Romanization.

# Grammar

stuff will be added here eventually...

# Common expressions / idioms

stuff will be added here eventually...

# Number system

stuff will be added here eventually...

# Larger translation examples

stuff will be added here eventually...

# Reference dictionary

stuff will be added here eventually...

# Glossing abbreviations

stuff will be added here eventually...

# Additional conlang tools

stuff will be added here eventually...
