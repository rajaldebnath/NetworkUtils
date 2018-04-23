#! /bin/bash
export LIB=/media/sf_Share/CoNet3/lib
export CLASSPATH=${CLASSPATH}:${LIB}/CoNet.jar
echo ${CLASSPATH}


for b in 1 2 3 4 5 6 7 8 9 10;
	do
		java be.ac.vub.bsb.cooccurrence.cmd.CooccurrenceAnalyser --method ensemble --input 1_$b.txt --correlnonrandp none --multicorr none --scoremergestrategy mean --measure2 supp --measure1 conf --min 1 --minsupport 2 --max 3 --thresholdguessing edgeNumber --ensemblemethods correl_pearson/correl_spearman//dist_bray/dist_kullbackleibler --kernelwidth 0.25 --nantreatmentparam 1 --minetdisc equalfreq --minetmiestimator mi.shrink --nantreatment none --networkmergestrategy union --matrixtype abundance --guessingparam 1000.0 --resamplemethod shuffle_rows --stand col_norm --format gdl --edgethreshold 0.05 --verbosity FATAL --iterations 100 --inference mrnet --topbottom --keepfilteredrows --multigraph --renorm --filter row_minocc/noinclusivetaxalinks/rand --filterparameter 0.0  --output 1_$b-CoNetperm
		java be.ac.vub.bsb.cooccurrence.cmd.CooccurrenceAnalyser --method ensemble --input 1_$b.txt --correlnonrandp none --multicorr none --scoremergestrategy mean --measure2 supp --measure1 conf --min 1 --minsupport 2 --randroutine edgeScores --max 3 --randscorefile C:\Share\SparCC\1_1-perms --ensemblemethods correl_pearson/correl_spearman//dist_bray/dist_kullbackleibler --kernelwidth 0.25 --nantreatmentparam 1 --minetdisc equalfreq --minetmiestimator mi.shrink --nantreatment none --networkmergestrategy union --matrixtype abundance --resamplemethod shuffle_rows --stand col_norm --format gdl --edgethreshold 0.05 --verbosity FATAL --iterations 100 --inference mrnet --scoreexport --keepfilteredrows --multigraph --renorm --filter row_minocc/noinclusivetaxalinks/rand --filterparameter 0.0 --output 1_$b-CoNetpermNET  --ensembleparamfile 1_$b-CoNetperm
		
		java be.ac.vub.bsb.cooccurrence.cmd.CooccurrenceAnalyser --method ensemble --input 1_$b.txt --correlnonrandp none --multicorr benjaminihochberg --scoremergestrategy mean --measure2 supp --measure1 conf --min 1 --minsupport 2 --max 3 --nulldistribfile 1_$b-CoNetpermNET  --thresholdguessing edgeNumber --ensemblemethods correl_pearson/correl_spearman//dist_bray/dist_kullbackleibler --kernelwidth 0.25 --nantreatmentparam 1 --minetdisc equalfreq --minetmiestimator mi.shrink --nantreatment none --networkmergestrategy union --matrixtype abundance --guessingparam 1000.0 --resamplemethod bootstrap --stand col_norm --format gdl --edgethreshold 0.05 --verbosity FATAL --iterations 100 --inference mrnet --pvaluemerge fisher --topbottom --keepfilteredrows --multigraph --filter row_minocc/noinclusivetaxalinks/rand/confidence_boot --filterparameter 0.0  --output 1_$b-CoNetboots
		java be.ac.vub.bsb.cooccurrence.cmd.CooccurrenceAnalyser --method ensemble --input 1_$b.txt --correlnonrandp none --multicorr benjaminihochberg --scoremergestrategy mean --measure2 supp --measure1 conf --min 1 --minsupport 2 --randroutine edgeScores --max 3 --ensemblemethods correl_pearson/correl_spearman//dist_bray/dist_kullbackleibler --kernelwidth 0.25 --nantreatmentparam 1 --minetdisc equalfreq --minetmiestimator mi.shrink --nantreatment none --networkmergestrategy union --matrixtype abundance --resamplemethod bootstrap --stand col_norm --format tab_table --edgethreshold 0.05 --verbosity FATAL --iterations 100 --inference mrnet --pvaluemerge fisher --scoreexport --keepfilteredrows --multigraph --filter row_minocc/noinclusivetaxalinks/rand/confidence_boot --filterparameter 0.0 --output 1_$b-fisher.txt --ensembleparamfile 1_$b-CoNetboots

		java be.ac.vub.bsb.cooccurrence.cmd.CooccurrenceAnalyser --method ensemble --input 1_$b.txt --correlnonrandp none --multicorr benjaminihochberg --scoremergestrategy mean --measure2 supp --measure1 conf --min 1 --minsupport 2 --max 3 --nulldistribfile 1_$b-CoNetpermNET  --thresholdguessing edgeNumber --ensemblemethods correl_pearson/correl_spearman//dist_bray/dist_kullbackleibler --kernelwidth 0.25 --nantreatmentparam 1 --minetdisc equalfreq --minetmiestimator mi.shrink --nantreatment none --networkmergestrategy union --matrixtype abundance --guessingparam 1000.0 --resamplemethod bootstrap --stand col_norm --format gdl --edgethreshold 0.05 --verbosity FATAL --iterations 100 --inference mrnet --pvaluemerge brown --topbottom --keepfilteredrows --multigraph --filter row_minocc/noinclusivetaxalinks/rand/confidence_boot --filterparameter 0.0  --output 1_$b-CoNetboots
		java be.ac.vub.bsb.cooccurrence.cmd.CooccurrenceAnalyser --method ensemble --input 1_$b.txt --correlnonrandp none --multicorr benjaminihochberg --scoremergestrategy mean --measure2 supp --measure1 conf --min 1 --minsupport 2 --randroutine edgeScores --max 3 --ensemblemethods correl_pearson/correl_spearman//dist_bray/dist_kullbackleibler --kernelwidth 0.25 --nantreatmentparam 1 --minetdisc equalfreq --minetmiestimator mi.shrink --nantreatment none --networkmergestrategy union --matrixtype abundance --resamplemethod bootstrap --stand col_norm --format tab_table --edgethreshold 0.05 --verbosity FATAL --iterations 100 --inference mrnet --pvaluemerge brown --scoreexport --keepfilteredrows --multigraph --filter row_minocc/noinclusivetaxalinks/rand/confidence_boot --filterparameter 0.0 --output 1_$b-brown.txt --ensembleparamfile 1_$b-CoNetboots
done

for a in {2..11};
do
	for b in 1 2 3 4 5 6 7 8 9 10;
	do
		java be.ac.vub.bsb.cooccurrence.cmd.CooccurrenceAnalyser --method ensemble --input ${a}_$b.txt --features  ${a}_$b-features.txt --correlnonrandp none --multicorr none --scoremergestrategy mean --measure2 supp --measure1 conf --min 1 --minsupport 2 --max 3 --thresholdguessing edgeNumber --ensemblemethods correl_pearson/correl_spearman//dist_bray/dist_kullbackleibler --kernelwidth 0.25 --nantreatmentparam 1 --minetdisc equalfreq --minetmiestimator mi.shrink --nantreatment none --networkmergestrategy union --matrixtype abundance --guessingparam 1000.0 --resamplemethod shuffle_rows --stand col_norm --format gdl --edgethreshold 0.05 --verbosity FATAL --iterations 100 --inference mrnet --topbottom --keepfilteredrows --multigraph --renorm --filter row_minocc/noinclusivetaxalinks/rand --filterparameter 0.0  --output ${a}_$b-CoNetperm
		java be.ac.vub.bsb.cooccurrence.cmd.CooccurrenceAnalyser --method ensemble --input ${a}_$b.txt --features  ${a}_$b-features.txt --correlnonrandp none --multicorr none --scoremergestrategy mean --measure2 supp --measure1 conf --min 1 --minsupport 2 --randroutine edgeScores --max 3 --randscorefile C:\Share\SparCC\1_1-perms --ensemblemethods correl_pearson/correl_spearman//dist_bray/dist_kullbackleibler --kernelwidth 0.25 --nantreatmentparam 1 --minetdisc equalfreq --minetmiestimator mi.shrink --nantreatment none --networkmergestrategy union --matrixtype abundance --resamplemethod shuffle_rows --stand col_norm --format gdl --edgethreshold 0.05 --verbosity FATAL --iterations 100 --inference mrnet --scoreexport --keepfilteredrows --multigraph --renorm --filter row_minocc/noinclusivetaxalinks/rand --filterparameter 0.0 --output ${a}_$b-CoNetpermNET  --ensembleparamfile ${a}_$b-CoNetperm
		
		java be.ac.vub.bsb.cooccurrence.cmd.CooccurrenceAnalyser --method ensemble --input ${a}_$b.txt --features  ${a}_$b-features.txt --correlnonrandp none --multicorr benjaminihochberg --scoremergestrategy mean --measure2 supp --measure1 conf --min 1 --minsupport 2 --max 3 --nulldistribfile ${a}_$b-CoNetpermNET  --thresholdguessing edgeNumber --ensemblemethods correl_pearson/correl_spearman//dist_bray/dist_kullbackleibler --kernelwidth 0.25 --nantreatmentparam 1 --minetdisc equalfreq --minetmiestimator mi.shrink --nantreatment none --networkmergestrategy union --matrixtype abundance --guessingparam 1000.0 --resamplemethod bootstrap --stand col_norm --format gdl --edgethreshold 0.05 --verbosity FATAL --iterations 100 --inference mrnet --pvaluemerge fisher --topbottom --keepfilteredrows --multigraph --filter row_minocc/noinclusivetaxalinks/rand/confidence_boot --filterparameter 0.0  --output ${a}_$b-CoNetboots
		java be.ac.vub.bsb.cooccurrence.cmd.CooccurrenceAnalyser --method ensemble --input ${a}_$b.txt --features  ${a}_$b-features.txt --correlnonrandp none --multicorr benjaminihochberg --scoremergestrategy mean --measure2 supp --measure1 conf --min 1 --minsupport 2 --randroutine edgeScores --max 3 --ensemblemethods correl_pearson/correl_spearman//dist_bray/dist_kullbackleibler --kernelwidth 0.25 --nantreatmentparam 1 --minetdisc equalfreq --minetmiestimator mi.shrink --nantreatment none --networkmergestrategy union --matrixtype abundance --resamplemethod bootstrap --stand col_norm --format tab_table --edgethreshold 0.05 --verbosity FATAL --iterations 100 --inference mrnet --pvaluemerge fisher --scoreexport --keepfilteredrows --multigraph --filter row_minocc/noinclusivetaxalinks/rand/confidence_boot --filterparameter 0.0 --output ${a}_$b-fisher.txt --ensembleparamfile ${a}_$b-CoNetboots

		java be.ac.vub.bsb.cooccurrence.cmd.CooccurrenceAnalyser --method ensemble --input ${a}_$b.txt --features  ${a}_$b-features.txt --correlnonrandp none --multicorr benjaminihochberg --scoremergestrategy mean --measure2 supp --measure1 conf --min 1 --minsupport 2 --max 3 --nulldistribfile ${a}_$b-CoNetpermNET  --thresholdguessing edgeNumber --ensemblemethods correl_pearson/correl_spearman//dist_bray/dist_kullbackleibler --kernelwidth 0.25 --nantreatmentparam 1 --minetdisc equalfreq --minetmiestimator mi.shrink --nantreatment none --networkmergestrategy union --matrixtype abundance --guessingparam 1000.0 --resamplemethod bootstrap --stand col_norm --format gdl --edgethreshold 0.05 --verbosity FATAL --iterations 100 --inference mrnet --pvaluemerge brown --topbottom --keepfilteredrows --multigraph --filter row_minocc/noinclusivetaxalinks/rand/confidence_boot --filterparameter 0.0  --output ${a}_$b-CoNetboots
		java be.ac.vub.bsb.cooccurrence.cmd.CooccurrenceAnalyser --method ensemble --input ${a}_$b.txt --features  ${a}_$b-features.txt --correlnonrandp none --multicorr benjaminihochberg --scoremergestrategy mean --measure2 supp --measure1 conf --min 1 --minsupport 2 --randroutine edgeScores --max 3 --ensemblemethods correl_pearson/correl_spearman//dist_bray/dist_kullbackleibler --kernelwidth 0.25 --nantreatmentparam 1 --minetdisc equalfreq --minetmiestimator mi.shrink --nantreatment none --networkmergestrategy union --matrixtype abundance --resamplemethod bootstrap --stand col_norm --format tab_table --edgethreshold 0.05 --verbosity FATAL --iterations 100 --inference mrnet --pvaluemerge brown --scoreexport --keepfilteredrows --multigraph --filter row_minocc/noinclusivetaxalinks/rand/confidence_boot --filterparameter 0.0 --output ${a}_$b-brown.txt --ensembleparamfile ${a}_$b-CoNetboots

		echo "${a} $b done!";
	done
done

