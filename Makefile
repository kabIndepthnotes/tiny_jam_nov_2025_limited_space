default: all-script

mc-script:
	lit --tangle lits/mc.lit --out-dir scripts
	lit --weave lits/mc.lit --out-dir docs

mc-server:
	ls lits/mc.lit | entr -s "make mc-script"

interact-script:
	lit --tangle lits/interact_area.lit --out-dir scripts
	lit --weave  lits/interact_area.lit --out-dir docs

all-script: mc-script interact-script

