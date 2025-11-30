mc-script:
	lit --tangle lits/mc.lit --out-dir scripts
	lit --weave lits/mc.lit --out-dir docs

mc-server:
	ls lits/mc.lit | entr -s "make mc-script"
