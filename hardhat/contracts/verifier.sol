// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity >=0.7.0 <0.9.0;

contract Groth16Verifier {
    // Scalar field size
    uint256 constant r    = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q   = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax  = 20491192805390485299153009773594534940189261866228447918068658471970481763042;
    uint256 constant alphay  = 9383485363053290200918347156157836566562967994039712273449902621266178545958;
    uint256 constant betax1  = 4252822878758300859123897981450591353533073413197771768651442665752259397132;
    uint256 constant betax2  = 6375614351688725206403948262868962793625744043794305715222011528459656738731;
    uint256 constant betay1  = 21847035105528745403288232691147584728191162732299865338377159692350059136679;
    uint256 constant betay2  = 10505242626370262277552901082094356697409835680220590971873171140371331206856;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 8203720524771322574924641815387026420866974560498208257625641904330457400081;
    uint256 constant deltax2 = 6191321002393622089321260614276994295532896629946136351865137064685580868037;
    uint256 constant deltay1 = 21657770858257830592899460190145985661685255803039598114119054800149489986972;
    uint256 constant deltay2 = 1929433773262105825574990739952093630443660020937400155390172351028659198964;

    
    uint256 constant IC0x = 8831944438521714914694490275384228289958349399235824631813533314566712771228;
    uint256 constant IC0y = 19776500460075058870445869052248726327105761027614147164101389921992305184041;
    
    uint256 constant IC1x = 11654859541003009048143350100993573986192779694549346767541615950935638097979;
    uint256 constant IC1y = 19309238554908149139034172500204371242151198686109367546115708428785942758731;
    
    uint256 constant IC2x = 7523278642267779410329351196910100988803233964415862298122200310014897689479;
    uint256 constant IC2y = 6400978576980708904482593477269142615733238537145680871577618291705825747038;
    
    uint256 constant IC3x = 14784464198395614623127454067657589365640059038258375034114188577163059563551;
    uint256 constant IC3y = 16179832550707949491625939766368143202292706941698813964157824552025739170847;
    
    uint256 constant IC4x = 19662983647706416684326809090028430395592854387567773380048172655726324249267;
    uint256 constant IC4y = 4399397715352235073411640041367977188041661592227402461786580944609550753836;
    
    uint256 constant IC5x = 10410935376025442386080814738883948976300905118531627999162959967365403458145;
    uint256 constant IC5y = 15672858989809565916411526659945892732041734111249273197642401447094413870452;
    
    uint256 constant IC6x = 9163238745193572211748047302706418044621155056660083738315512247212420633164;
    uint256 constant IC6y = 13350208890067279521601560923927673161935258490632841785591094117720844572072;
    
    uint256 constant IC7x = 496316957315231951891708961241605493769017844070062908456596787102770518115;
    uint256 constant IC7y = 17552715079337700073458633857806453380432914106725101191935412177955224136572;
    
    uint256 constant IC8x = 7246335381313017555595247398528853462088547150213426251342255726236368182977;
    uint256 constant IC8y = 8906577686159916254250016726140536448125832935847495231711538763793315671558;
    
    uint256 constant IC9x = 11438705184409980989719062169034872397891143796427623875708550989460207419443;
    uint256 constant IC9y = 16180931115542562068629464469678574049248222296789137750420336698332501562002;
    
    uint256 constant IC10x = 15993021384153326670693920361625336018405965955772112473561386140116226847959;
    uint256 constant IC10y = 19801486049246253120880688962605648465540523347852404026243193573119145137129;
    
    uint256 constant IC11x = 7917490910526890280230393884396666691169153416696812524082157960761438967946;
    uint256 constant IC11y = 6533359211455737513677825611630237143352703962167404566132215479097966073971;
    
    uint256 constant IC12x = 8752402918029605741689168212717032283351732241301003929998832637996083605072;
    uint256 constant IC12y = 3884277586735607023893506120167692492729873900207275324856436093214790503941;
    
    uint256 constant IC13x = 10568463296674064112197858563776137039122903828410028876677870681381775888632;
    uint256 constant IC13y = 3610623053440020364103533255087839254874630924019079266779802111833241754168;
    
    uint256 constant IC14x = 988207397867367580035869431222245858457883291657982206835142112538986173904;
    uint256 constant IC14y = 10232606344976638026693551119549649355095542860620332709175073322246492038244;
    
    uint256 constant IC15x = 1247635580573211750847662023413890260599065049016630062847131818771684502089;
    uint256 constant IC15y = 10897443441461998571822750109927690940761047662754798300272553725142497077690;
    
    uint256 constant IC16x = 6818447807225465082538336402932154879730015888161582986303301929832883389497;
    uint256 constant IC16y = 21271000305448434350169790083050432893652322409474747323916889125578129440130;
    
    uint256 constant IC17x = 6848712279161752010786764341424851373545597668339128996782130996572505947921;
    uint256 constant IC17y = 11235999349770296206197945877047504350926535786076572972035476633988824461021;
    
    uint256 constant IC18x = 6637785522412150035184573173222877540535905775876974650148836822628781072308;
    uint256 constant IC18y = 13144378731962066619523882994522421939141167549243581263579758035598561025055;
    
    uint256 constant IC19x = 1130741195442669154004594938888478233227770118818738774188298471001755523363;
    uint256 constant IC19y = 20408244318235208310183686835490347537177794061535954329443615460414802144095;
    
    uint256 constant IC20x = 15515784317615128978742277790670306713917805001785327504052150700561698577678;
    uint256 constant IC20y = 11548258119847671722547251939144906427948218379856535749034619326726573645850;
    
    uint256 constant IC21x = 17762908649148632436434541866281254244922943470914204948019676745748811224638;
    uint256 constant IC21y = 8220662404818180999107069524852241626978349140838079760853139496364044751069;
    
    uint256 constant IC22x = 19607004575116151831831378890711865136273987047965322038548517997359299338973;
    uint256 constant IC22y = 12573816913506042097911140423101785626838377188423604568465304041140618904758;
    
    uint256 constant IC23x = 6018958334967601237478937873023853841633107983883685399810371813499145454766;
    uint256 constant IC23y = 6829499509883287973716264627063259693920811161313997806612002862787076888289;
    
    uint256 constant IC24x = 7051162808464567270504884419971861116772923030769212144953750196627392143920;
    uint256 constant IC24y = 6659374238671379183050321937114774495361848835645261702938538123547281240799;
    
    uint256 constant IC25x = 13383251489476320046396839598173711314003754023484492609958641860364512704594;
    uint256 constant IC25y = 1843204354018558107050129869754750110029151743217704876627405819930456363431;
    
    uint256 constant IC26x = 837829949992684610388559231766624223446588976329714816283144517074101379576;
    uint256 constant IC26y = 2219983822018960119731805970893457970204866137172704068119476506309125219826;
    
    uint256 constant IC27x = 7050064270566954772227283990520140607728118430514926871510016662844131270634;
    uint256 constant IC27y = 10534000131068517603978484777191202991311580242400065081020837943593081565926;
    
    uint256 constant IC28x = 14771970132959392785435134309504978910483966771052534837299750841329161870027;
    uint256 constant IC28y = 7095615023553468372607994015973711608823180315338218693580889087416961357470;
    
    uint256 constant IC29x = 2219915885936743704967853848358082610480004531483997607682928922660722050915;
    uint256 constant IC29y = 7241280616280629306851848891323083097739490800963531684398255537364882307915;
    
    uint256 constant IC30x = 5680211362831203371109841002618894247274527008875785120999699846109624692898;
    uint256 constant IC30y = 12232158480389634046340774458281303783180765615925710015886697913677211776799;
    
    uint256 constant IC31x = 2442619647325007544477753883414632245392023714868227810648320413086372613579;
    uint256 constant IC31y = 19144969862260035400300544057465705899596870218475910336706026207523199807403;
    
    uint256 constant IC32x = 17436921200081914705831627981817157212408816367537475527893178104897812448976;
    uint256 constant IC32y = 18048991527163707766234654584291168867187739068884651674149936415472586835565;
    
    uint256 constant IC33x = 12914925502372484967257098611001369060877117879481493039522152129514584408529;
    uint256 constant IC33y = 1505448891590303657140681554803741403280393943298616154062944282262005409955;
    
    uint256 constant IC34x = 8449742891732121867200266241387753326740239688579960412464510932571164757594;
    uint256 constant IC34y = 5575517483110752462226974376149094794646462888453094110398377845663401014441;
    
    uint256 constant IC35x = 7431999276431018142663904939955215545849120624226329245414195098110104995383;
    uint256 constant IC35y = 17626486186368173234664651817894293862216944650703947116163055659453748496640;
    
    uint256 constant IC36x = 21766458650664202105071418683762303919823579584108590905330098598401381549030;
    uint256 constant IC36y = 11031333032902368533284232052515174975149673368264656660458677328816442692247;
    
    uint256 constant IC37x = 9160143176383540699936970131136097387487691616667558607997177246594420244836;
    uint256 constant IC37y = 15616849091523146413335404267826696269745841163160439028061707070460824251331;
    
    uint256 constant IC38x = 2040672521473947264917384435801947147105198181314452326105887526426140890662;
    uint256 constant IC38y = 9112487147897625144287747563821407013191895048804675809000945095301311544084;
    
    uint256 constant IC39x = 19700312226146240059090929032181292739809103453088230096838931280262059666245;
    uint256 constant IC39y = 9257416852783863647884431659322004247465037012853042776392388754175367804625;
    
    uint256 constant IC40x = 7115581801159969543402892627020064957127886108269083818229382417806602421971;
    uint256 constant IC40y = 17598048031299672052315155786265920545668577911010998512742459639382386031107;
    
    uint256 constant IC41x = 6451065691125920219940327759070805171662889331971039512536316878066317357017;
    uint256 constant IC41y = 10694141323463717200833878545388349611940550411301565745439844356086656070728;
    
    uint256 constant IC42x = 1903534648618212666406073787318248849299656683382334610100856935471843842170;
    uint256 constant IC42y = 18783914122537670215108418478307557623123424807223573885826026418437181177574;
    
    uint256 constant IC43x = 4431166299024554424774857176796073317849275420490519613406143254319486820045;
    uint256 constant IC43y = 16646214189573752540761127848641063534157986673898340195917081160747512000010;
    
    uint256 constant IC44x = 9767865659605941661459168780149604529745884698900745040748599843281930288518;
    uint256 constant IC44y = 8385695652475481043120648114288231400558891304475480496433076945470455374;
    
    uint256 constant IC45x = 13134974127270983203871525982420275999320420819668403425705726427464994107513;
    uint256 constant IC45y = 20302980599047528982984309542932836619212284311598530328018956546756803994779;
    
    uint256 constant IC46x = 11225423995421589120932828828293198751953915532465944925524102512801172832577;
    uint256 constant IC46y = 13024199384575156044782121208905756985459283330520507192428375862373547663457;
    
    uint256 constant IC47x = 19545316928743415779771275908186405891885807233404034737654370618383174242569;
    uint256 constant IC47y = 6455393813498903972372592853137093836937220388691320228300899761007085588726;
    
    uint256 constant IC48x = 20672078071785479871241490190484495485410864320027175071279935823078103927821;
    uint256 constant IC48y = 5594390551072840683258594765215037184696552132309055656695664072346492172701;
    
    uint256 constant IC49x = 15973226062907660244361549075870797439046453999893522111976624462128442647012;
    uint256 constant IC49y = 6827310334070431942822375896244595250630079014500394137606117387915141114577;
    
    uint256 constant IC50x = 14846744952257472133277541546710697513396392475268305388103585295378467595341;
    uint256 constant IC50y = 15865507783683463619097161533718542176935003051338120057772582403167888067044;
    
    uint256 constant IC51x = 18028331903928351771238942253419099786183327255339531447391309541492866552008;
    uint256 constant IC51y = 5587458085636288523324599069542362122136840798806506423053376030629883625919;
    
    uint256 constant IC52x = 7762529669440467572742222711146190061133794031084398055222963627678243244423;
    uint256 constant IC52y = 2276103970737041929446040639381724260828787781051858038788727312169255109627;
    
    uint256 constant IC53x = 5703747767131317077076999190068310556566326142883573011955853840764069873634;
    uint256 constant IC53y = 2210769214188934416789861747300468692552013916691058278365700651456757258072;
    
    uint256 constant IC54x = 19667917707342880450075144896272511811487060123665400135382853747397779768104;
    uint256 constant IC54y = 14872738299923278881623379016174681598054390196897742181396230434812161767184;
    
    uint256 constant IC55x = 15198040115618479544673465503054455105723978190351951445772439947447424391500;
    uint256 constant IC55y = 16719404211962285591541813084885058471960895286307061507788984600029546417502;
    
    uint256 constant IC56x = 14687389282110808879763821059481987974850254274837118997009175071694160868987;
    uint256 constant IC56y = 6542004367661546545708729058340864043261472002453614105589691025795555170891;
    
    uint256 constant IC57x = 954940507776971962903544286177193371502208454377015469055510851624961858502;
    uint256 constant IC57y = 15372269350607542736490357494120227465170550360607516927021684652962023440091;
    
    uint256 constant IC58x = 3302926150265646717606442415565097900958922010498265878726797208191636746331;
    uint256 constant IC58y = 1863417333269246234312303149600423993397452934607622511718148349536248532637;
    
    uint256 constant IC59x = 21413292863473020609758644350403308085549307986904434506471914555061943271613;
    uint256 constant IC59y = 1740507912713177422086564185565387942363220598854676180118688947189737923315;
    
    uint256 constant IC60x = 17383233269245103204683201227567195515678569627652230971245276049917604865429;
    uint256 constant IC60y = 18029706521429875246807689344252127227367870329289436350554928097615053072245;
    
    uint256 constant IC61x = 16449534264834643379780259637428840054089374652874077319875944935972202845998;
    uint256 constant IC61y = 6732648596511457071166137818617368437542814158811443309501976194208168222465;
    
    uint256 constant IC62x = 18826435654169867107127487354908448962257656879190578197395874146015948870969;
    uint256 constant IC62y = 10806643986773952623098804967552133778467748101085761820532014602487283460866;
    
    uint256 constant IC63x = 5440348810456072100686190194764821341455496833205949819989377246202161284128;
    uint256 constant IC63y = 2421245290516106375930136777804374199848299554932091011773103955424367404931;
    
    uint256 constant IC64x = 20404133918162751693523716057190480592077823289190369644968864839863253732966;
    uint256 constant IC64y = 12267411327035920414571408193691516034620906207230632795258690758091444196572;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[64] calldata _pubSignals) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, q)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }
            
            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x
                
                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))
                
                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))
                
                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))
                
                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))
                
                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))
                
                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))
                
                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))
                
                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))
                
                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))
                
                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))
                
                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))
                
                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))
                
                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))
                
                g1_mulAccC(_pVk, IC14x, IC14y, calldataload(add(pubSignals, 416)))
                
                g1_mulAccC(_pVk, IC15x, IC15y, calldataload(add(pubSignals, 448)))
                
                g1_mulAccC(_pVk, IC16x, IC16y, calldataload(add(pubSignals, 480)))
                
                g1_mulAccC(_pVk, IC17x, IC17y, calldataload(add(pubSignals, 512)))
                
                g1_mulAccC(_pVk, IC18x, IC18y, calldataload(add(pubSignals, 544)))
                
                g1_mulAccC(_pVk, IC19x, IC19y, calldataload(add(pubSignals, 576)))
                
                g1_mulAccC(_pVk, IC20x, IC20y, calldataload(add(pubSignals, 608)))
                
                g1_mulAccC(_pVk, IC21x, IC21y, calldataload(add(pubSignals, 640)))
                
                g1_mulAccC(_pVk, IC22x, IC22y, calldataload(add(pubSignals, 672)))
                
                g1_mulAccC(_pVk, IC23x, IC23y, calldataload(add(pubSignals, 704)))
                
                g1_mulAccC(_pVk, IC24x, IC24y, calldataload(add(pubSignals, 736)))
                
                g1_mulAccC(_pVk, IC25x, IC25y, calldataload(add(pubSignals, 768)))
                
                g1_mulAccC(_pVk, IC26x, IC26y, calldataload(add(pubSignals, 800)))
                
                g1_mulAccC(_pVk, IC27x, IC27y, calldataload(add(pubSignals, 832)))
                
                g1_mulAccC(_pVk, IC28x, IC28y, calldataload(add(pubSignals, 864)))
                
                g1_mulAccC(_pVk, IC29x, IC29y, calldataload(add(pubSignals, 896)))
                
                g1_mulAccC(_pVk, IC30x, IC30y, calldataload(add(pubSignals, 928)))
                
                g1_mulAccC(_pVk, IC31x, IC31y, calldataload(add(pubSignals, 960)))
                
                g1_mulAccC(_pVk, IC32x, IC32y, calldataload(add(pubSignals, 992)))
                
                g1_mulAccC(_pVk, IC33x, IC33y, calldataload(add(pubSignals, 1024)))
                
                g1_mulAccC(_pVk, IC34x, IC34y, calldataload(add(pubSignals, 1056)))
                
                g1_mulAccC(_pVk, IC35x, IC35y, calldataload(add(pubSignals, 1088)))
                
                g1_mulAccC(_pVk, IC36x, IC36y, calldataload(add(pubSignals, 1120)))
                
                g1_mulAccC(_pVk, IC37x, IC37y, calldataload(add(pubSignals, 1152)))
                
                g1_mulAccC(_pVk, IC38x, IC38y, calldataload(add(pubSignals, 1184)))
                
                g1_mulAccC(_pVk, IC39x, IC39y, calldataload(add(pubSignals, 1216)))
                
                g1_mulAccC(_pVk, IC40x, IC40y, calldataload(add(pubSignals, 1248)))
                
                g1_mulAccC(_pVk, IC41x, IC41y, calldataload(add(pubSignals, 1280)))
                
                g1_mulAccC(_pVk, IC42x, IC42y, calldataload(add(pubSignals, 1312)))
                
                g1_mulAccC(_pVk, IC43x, IC43y, calldataload(add(pubSignals, 1344)))
                
                g1_mulAccC(_pVk, IC44x, IC44y, calldataload(add(pubSignals, 1376)))
                
                g1_mulAccC(_pVk, IC45x, IC45y, calldataload(add(pubSignals, 1408)))
                
                g1_mulAccC(_pVk, IC46x, IC46y, calldataload(add(pubSignals, 1440)))
                
                g1_mulAccC(_pVk, IC47x, IC47y, calldataload(add(pubSignals, 1472)))
                
                g1_mulAccC(_pVk, IC48x, IC48y, calldataload(add(pubSignals, 1504)))
                
                g1_mulAccC(_pVk, IC49x, IC49y, calldataload(add(pubSignals, 1536)))
                
                g1_mulAccC(_pVk, IC50x, IC50y, calldataload(add(pubSignals, 1568)))
                
                g1_mulAccC(_pVk, IC51x, IC51y, calldataload(add(pubSignals, 1600)))
                
                g1_mulAccC(_pVk, IC52x, IC52y, calldataload(add(pubSignals, 1632)))
                
                g1_mulAccC(_pVk, IC53x, IC53y, calldataload(add(pubSignals, 1664)))
                
                g1_mulAccC(_pVk, IC54x, IC54y, calldataload(add(pubSignals, 1696)))
                
                g1_mulAccC(_pVk, IC55x, IC55y, calldataload(add(pubSignals, 1728)))
                
                g1_mulAccC(_pVk, IC56x, IC56y, calldataload(add(pubSignals, 1760)))
                
                g1_mulAccC(_pVk, IC57x, IC57y, calldataload(add(pubSignals, 1792)))
                
                g1_mulAccC(_pVk, IC58x, IC58y, calldataload(add(pubSignals, 1824)))
                
                g1_mulAccC(_pVk, IC59x, IC59y, calldataload(add(pubSignals, 1856)))
                
                g1_mulAccC(_pVk, IC60x, IC60y, calldataload(add(pubSignals, 1888)))
                
                g1_mulAccC(_pVk, IC61x, IC61y, calldataload(add(pubSignals, 1920)))
                
                g1_mulAccC(_pVk, IC62x, IC62y, calldataload(add(pubSignals, 1952)))
                
                g1_mulAccC(_pVk, IC63x, IC63y, calldataload(add(pubSignals, 1984)))
                
                g1_mulAccC(_pVk, IC64x, IC64y, calldataload(add(pubSignals, 2016)))
                

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))


                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)


                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F
            
            checkField(calldataload(add(_pubSignals, 0)))
            
            checkField(calldataload(add(_pubSignals, 32)))
            
            checkField(calldataload(add(_pubSignals, 64)))
            
            checkField(calldataload(add(_pubSignals, 96)))
            
            checkField(calldataload(add(_pubSignals, 128)))
            
            checkField(calldataload(add(_pubSignals, 160)))
            
            checkField(calldataload(add(_pubSignals, 192)))
            
            checkField(calldataload(add(_pubSignals, 224)))
            
            checkField(calldataload(add(_pubSignals, 256)))
            
            checkField(calldataload(add(_pubSignals, 288)))
            
            checkField(calldataload(add(_pubSignals, 320)))
            
            checkField(calldataload(add(_pubSignals, 352)))
            
            checkField(calldataload(add(_pubSignals, 384)))
            
            checkField(calldataload(add(_pubSignals, 416)))
            
            checkField(calldataload(add(_pubSignals, 448)))
            
            checkField(calldataload(add(_pubSignals, 480)))
            
            checkField(calldataload(add(_pubSignals, 512)))
            
            checkField(calldataload(add(_pubSignals, 544)))
            
            checkField(calldataload(add(_pubSignals, 576)))
            
            checkField(calldataload(add(_pubSignals, 608)))
            
            checkField(calldataload(add(_pubSignals, 640)))
            
            checkField(calldataload(add(_pubSignals, 672)))
            
            checkField(calldataload(add(_pubSignals, 704)))
            
            checkField(calldataload(add(_pubSignals, 736)))
            
            checkField(calldataload(add(_pubSignals, 768)))
            
            checkField(calldataload(add(_pubSignals, 800)))
            
            checkField(calldataload(add(_pubSignals, 832)))
            
            checkField(calldataload(add(_pubSignals, 864)))
            
            checkField(calldataload(add(_pubSignals, 896)))
            
            checkField(calldataload(add(_pubSignals, 928)))
            
            checkField(calldataload(add(_pubSignals, 960)))
            
            checkField(calldataload(add(_pubSignals, 992)))
            
            checkField(calldataload(add(_pubSignals, 1024)))
            
            checkField(calldataload(add(_pubSignals, 1056)))
            
            checkField(calldataload(add(_pubSignals, 1088)))
            
            checkField(calldataload(add(_pubSignals, 1120)))
            
            checkField(calldataload(add(_pubSignals, 1152)))
            
            checkField(calldataload(add(_pubSignals, 1184)))
            
            checkField(calldataload(add(_pubSignals, 1216)))
            
            checkField(calldataload(add(_pubSignals, 1248)))
            
            checkField(calldataload(add(_pubSignals, 1280)))
            
            checkField(calldataload(add(_pubSignals, 1312)))
            
            checkField(calldataload(add(_pubSignals, 1344)))
            
            checkField(calldataload(add(_pubSignals, 1376)))
            
            checkField(calldataload(add(_pubSignals, 1408)))
            
            checkField(calldataload(add(_pubSignals, 1440)))
            
            checkField(calldataload(add(_pubSignals, 1472)))
            
            checkField(calldataload(add(_pubSignals, 1504)))
            
            checkField(calldataload(add(_pubSignals, 1536)))
            
            checkField(calldataload(add(_pubSignals, 1568)))
            
            checkField(calldataload(add(_pubSignals, 1600)))
            
            checkField(calldataload(add(_pubSignals, 1632)))
            
            checkField(calldataload(add(_pubSignals, 1664)))
            
            checkField(calldataload(add(_pubSignals, 1696)))
            
            checkField(calldataload(add(_pubSignals, 1728)))
            
            checkField(calldataload(add(_pubSignals, 1760)))
            
            checkField(calldataload(add(_pubSignals, 1792)))
            
            checkField(calldataload(add(_pubSignals, 1824)))
            
            checkField(calldataload(add(_pubSignals, 1856)))
            
            checkField(calldataload(add(_pubSignals, 1888)))
            
            checkField(calldataload(add(_pubSignals, 1920)))
            
            checkField(calldataload(add(_pubSignals, 1952)))
            
            checkField(calldataload(add(_pubSignals, 1984)))
            
            checkField(calldataload(add(_pubSignals, 2016)))
            
            checkField(calldataload(add(_pubSignals, 2048)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
