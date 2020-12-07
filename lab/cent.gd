extends Node2D

var labpro = [[1,11,100,12],[1,11,100,16],[1,11,100,26],[1,11,100,36],[0,5,100,50],[0,1,100,61],[0,1,100,66],[0,0,100,70],[0,0,100,90],[0,0,100,99],[0,0,0,100]]
var x = [0,0,0,0,0,0,0,0,0,0,0,7]
var y = [0,0,0,0,0,0,0,0,0,0,0,7]
var xx = 0
var yy = 0
var rng = RandomNumberGenerator.new()
var zero = [[7.0,7.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0],[0.0,0.0]]
var izero = 0
func _ready():
	izero = 0
	rng.randomize()
	var lo = rng.randf_range(0, 100)
	$title.set_cell(x[11],y[11],1)
	if lo>40:
		xx = x[11]
		yy = y[11]-1
		lab(0,1)
		xx = x[11]
		yy = y[11]
		lab(0,2)
		xx = x[11]
		yy = y[11]+1
		lab(0,3)
	elif lo>10:
		xx = x[11]
		yy = y[11]-1
		lab(0,1)
		xx = x[11]
		yy = y[11]+1
		lab(0,3)
	else:
		xx = x[11]
		yy = y[11]
		lab(0,2)
	lo = rng.randf_range(0, izero)
	$"meta/ściana".position.x = zero[lo][0]*64
	$"meta/ściana".position.y = zero[lo][1]*64

func gdzie(st):
	if(st ==4):
		st=0;
	if(st==-1):
		st=3;
	if(st==-2):
		st=2;
	if(st==5):
		st=1;
	if(st==0):
		xx-=1;
	elif(st==1):
		yy+=1;
	elif(st==2):
		xx+=1;
	else:
		yy-=1;

func lab(l,st):
	gdzie(st)
	rng.randomize()
	x[l] = xx
	y[l] = yy
	$title.set_cell(x[l],y[l],1)
	var lo = rng.randf_range(0, 100)
	if labpro[l][0]>lo:
		
		lab(l+1,st-1)
		xx = x[l]
		yy = y[l]
		lab(l+1,st)
		xx = x[l]
		yy = y[l]
		lab(l+1,st+1)
		xx = x[l]
		yy = y[l]
	elif labpro[l][1]>lo:
		lab(l+1,st-1)
		xx = x[l]
		yy = y[l]
		lab(l+1,st+1)
		xx = x[l]
		yy = y[l]
	elif labpro[l][3]>lo:
		zero[izero][0] = x[l]
		zero[izero][1] = y[l]
		izero +=1
		return 0
	else:
		lab(l+1,st)
		xx = x[l]
		yy = y[l]

