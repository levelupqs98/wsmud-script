// raid.flow
// 快速打武道，不等CD，不疗伤。砍完99层才结束。
// 四区：白三三
<-stopSSAuto
<-recordGains
stopstate
@cmdDelay 500
//@renew
jh fam 9 start
@toolbar jh
@toolbar tasks
@task 武道塔可以重置，进度($currentN)/($finalN)，|武道塔已重置，进度($currentN)/($finalN)，
@print (currentN)/(finalN)
[if] (currentN) == (finalN)
    select {r守门人};ask1 {r守门人}
    @tip 从头开始挑战|已经重置
go enter
[while] true
    ($type1) = 0
    [if] (:room) == 武道塔-第一百层
        [break]
    kill {r武道塔守护者}?
    @tip 你的挑战($type1)了|你现在可以进入|不要急|你要攻击谁
    [if] (type1) != 0
        ($type1) = 0
        kill {r武道塔守护者}?
    [else]
        go up
recordGains->
stopSSAuto->
stopstate
@tidyBag
@renew
$zdwk