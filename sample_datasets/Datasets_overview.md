# Exploring available VCF files for SARS-CoV2 hosts

## Whole Genome Sequencing of hosts

There is very little data on the genetic profiles of patients.  
Only one study was found that fits the initial idea:
- [PRJNA837053] (https://www.ncbi.nlm.nih.gov/bioproject/837053)  
  
Studies dealing with such associations are mainly within frames of GWAS.

### GWAS

There are numerous GWAS studies aiming at deciphering the link between host genetic variations and patient outcomes (infection itself, severity, duration).  
A standrard visualization here would be to show Manhattan plots and then maybe a little zoom-in to regions identified by multiple studies.  
GWAS studies are not really the ones depositing raw data publicly. The analysis outcome is easily accessed (basically the table behing the Manhattan plot), but patient metadata and patient-level variants will be subject to extra security.  
It is not typical to get VCF files in this setting, first we would have to gain access to patient-level data and then run our own variant caller (like SnpEff). All this before we could start actual work.  
UCSC Genome Browser has already compiled a great resource gathering available data and enabling visualization:
- [covidHgiGwas] (https://genome.ucsc.edu/cgi-bin/hgTrackUi?db=hg38&g=covidHgiGwas)
A (not complete) list of GWAS studies:
- [GWAS genotype data of Japanese COVID-19 cases] (https://ega-archive.org/datasets/EGAD00001008957)
- 2020. [Genomewide Association Study of Severe Covid-19 with Respiratory Failure] (https://www.nejm.org/doi/full/10.1056/nejmoa2020283)
- 2021. [Genome-wide association study of hospitalized COVID-19 patients in the United Arab Emirates] (https://www.thelancet.com/journals/ebiom/article/PIIS2352-3964(21)00489-8/fulltext)
- 2022 [Detailed stratified GWAS analysis for severe COVID-19 in four European populations] (https://pubmed.ncbi.nlm.nih.gov/35848942/)
- 2022. [A Phenome-Wide Association Study of genes associated with COVID-19 severity reveals shared genetics with complex diseases in the Million Veteran Program] (https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1010113)
- 2022. [Implicating effector genes at COVID-19 GWAS loci using promoter-focused Capture-C in disease-relevant immune cell types] (https://genomebiology.biomedcentral.com/articles/10.1186/s13059-022-02691-1)
- 2022. [Genome-Wide Association Study of COVID-19 Outcomes Reveals Novel Host Genetic Risk Loci in the Serbian Population] (https://www.frontiersin.org/articles/10.3389/fgene.2022.911010/full)
- 2023. [Genome-wide Association Study of Long COVID] (https://www.medrxiv.org/content/10.1101/2023.06.29.23292056v1.full-text)
  
Some reviews:
- 2023. [GWAS and meta-analysis identifies 49 genetic variants underlying critical COVID-19] (https://www.nature.com/articles/s41586-023-06034-3)
- 2022. [Genome-wide association studies of COVID-19: Connecting the dots] (https://www.sciencedirect.com/science/article/pii/S1567134822001769)
- 2022. [Potential Genes Associated with COVID-19 and Comorbidity] (https://pubmed.ncbi.nlm.nih.gov/35165525/)


### RNASeq

There are some RNASeq data on SRA describing gene expression changes during the infection. Most of them are from cell lines, but the ones from actual patients might be used to do variant calling. Even if it is possible to reverse engineer some genetic variation from the transcriptome, it is doubtful if it is worth the effort and the extra pipeline.  
An SRA record for this:
- [PRJNA861390] (https://www.ncbi.nlm.nih.gov/bioproject/861390)

## Viral Variants

### Lineage based on the spike protein

There are co-existing nomenclatures (like PANGOLIN) trying to categorize isolates into strains. Typical visualizations include phylogenetic trees, geographic maps and ribbon charts showing clade share by time.  
- An important example is [Nextstrain] (https://nextstrain.org/)

### Non-spike variations

Not a lot of publications seem to deal with non-lineage-defining mutations. Not sure about their significance, but might be a niche for our tool.

## Conclusion

To visualize host genetic variants, GWAS study results would be an excellent source. There would rarely be VCFs, however. Genome annotation is still available via UCSC (via gtf for example), but we would have to think about the added value our tool offers over Genome Browser.  
Viral variants might be a lower hanging fruit, already in VCF format. Additional literature review is needed to be sure we are not reinventing the wheel.
