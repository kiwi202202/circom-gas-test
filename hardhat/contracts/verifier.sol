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
    uint256 constant deltax1 = 6129977887558064068924632325178409170056521742838842776361138575760082751842;
    uint256 constant deltax2 = 11939823033262983809503368617549679075730939353929344849324536985799185534222;
    uint256 constant deltay1 = 14541857786230565290566337010442185441320478988282906427423762618339479031282;
    uint256 constant deltay2 = 14611575750326351860931431812213289749943773054864285548734855422271594806969;

    
    uint256 constant IC0x = 10232378474803329989715890117592608600883413037768757883916585072741565274413;
    uint256 constant IC0y = 3387282387208714632537855442861240184965335788149895571196661692212253545602;
    
    uint256 constant IC1x = 9586318730629572522171496368386710326611504585163838310300028078306751309087;
    uint256 constant IC1y = 6411894305368683416014778702572174727816851939804163564259451583596042412435;
    
    uint256 constant IC2x = 3937935552213561316335857642580882189112288366677581513952449210123698672382;
    uint256 constant IC2y = 13928113418307912584492565284165679993145373246561100151170400085801500358651;
    
    uint256 constant IC3x = 17852699859624557483195610856749929165830142875629535149275234762224069340187;
    uint256 constant IC3y = 8700762747265855505672386212266479820958451333481025611676782170907180049300;
    
    uint256 constant IC4x = 21256433377884433391474257074109783657763028219521587553815693326309138871964;
    uint256 constant IC4y = 3920773590248600327517655128738734451013932139915042285919456635062231978421;
    
    uint256 constant IC5x = 5421771613451607329414462309569920523487857401482721918774263374068708834592;
    uint256 constant IC5y = 5427929100695049571306432997320664851397851416897520626625043061642539788189;
    
    uint256 constant IC6x = 134963264627055697524149979243379649398279614194825438260289430602411368241;
    uint256 constant IC6y = 13941668970433235275414786174627497640403249120755450850520250775398686358276;
    
    uint256 constant IC7x = 10266597667723542744424535820365612171007653876798421674579015150929409936364;
    uint256 constant IC7y = 508494798272230206857038524409834945692482739002557623147318364711605630458;
    
    uint256 constant IC8x = 17497415746059069196379044415059175231119243529640590024188236528550154292302;
    uint256 constant IC8y = 21752399803305804037420211866737236792198986784152086164236643722186870417675;
    
    uint256 constant IC9x = 980535898917969680083280303078161879123674791398750295495088022519594834563;
    uint256 constant IC9y = 1095648943221809200740630074855430605090722264017278871919585976350364512022;
    
    uint256 constant IC10x = 6482438138098934856680111704492111272962704948511453262345936038707549230427;
    uint256 constant IC10y = 16185892198812084061330905939425932839858692067956812777039079686491049952618;
    
    uint256 constant IC11x = 21372087086194725330842732925833859706837166286372659101144001950535855764693;
    uint256 constant IC11y = 8614439769826516380558373858195348175224977526077173777264978631881833984777;
    
    uint256 constant IC12x = 21221959364944456550336071650909398603353713584669959881664591371709116360582;
    uint256 constant IC12y = 9620005903774144190149840913084066366819366600687805472569160801953602176211;
    
    uint256 constant IC13x = 29666719590472547440173504550188263877823246537345031029702337138557672733;
    uint256 constant IC13y = 16060288287571313626003521093174017027066560380904589613716708195598216349576;
    
    uint256 constant IC14x = 6649020305708418625855693743677155446019424353857316016130837996948520013084;
    uint256 constant IC14y = 2922819176403655076995315873584478541456235741498483103424792500043216120558;
    
    uint256 constant IC15x = 21825295413294676806626531368330035408075379728204819888671642408634378973199;
    uint256 constant IC15y = 18730265687581735107823445018356549381505850049613270737817621968306209857002;
    
    uint256 constant IC16x = 20535349991785830760723074476154364120894638351575363048457373583089361041498;
    uint256 constant IC16y = 8552615193899369602844204270772162841510170031366366195480726613031485576069;
    
    uint256 constant IC17x = 8554558244632371232447893116042425099461173208451579462118904801877847224501;
    uint256 constant IC17y = 437208040689584524493788288627704761060630628997745298900523123697996380655;
    
    uint256 constant IC18x = 8692554989224714798682485693232344377582462069368967784798725708880298783636;
    uint256 constant IC18y = 10900202351553153389987581563076728176844999612593420729134943718194983712737;
    
    uint256 constant IC19x = 5600616723829317502372279447394172770509231441470265242756719257425030480823;
    uint256 constant IC19y = 11097257237570184441240856943938703143723329659136915010620177071357636781948;
    
    uint256 constant IC20x = 13626582312057019606455430576091446071536628197575646317931077848590884784154;
    uint256 constant IC20y = 948517453004731851435394075014022452177235829938624042131558234519422600313;
    
    uint256 constant IC21x = 20470028111091925866328879059294206769846200809044128951710547469509347933616;
    uint256 constant IC21y = 21404039690264964927798961522491882724456167498976413137617840845054823320456;
    
    uint256 constant IC22x = 15788693896973706362480152425135619995926105900570572668360067152370255915103;
    uint256 constant IC22y = 4483113130088512131708665236128090640148030298206219540845073213709317357093;
    
    uint256 constant IC23x = 16504220717093323563637705105093160406261466267375128589346712387149909902611;
    uint256 constant IC23y = 5347466972007220441703408556580869053410373838679611253279381783810800669981;
    
    uint256 constant IC24x = 6774115184217294610823239706226142310816594958038482783213417678542594647928;
    uint256 constant IC24y = 7766935111593567354125089459928470677923074664472259333366596859687181384031;
    
    uint256 constant IC25x = 4795803801169307321453468655628851191309410294004244788676015663344512262555;
    uint256 constant IC25y = 2184294525064887867610676272384426775524106165661155356392123796853267407923;
    
    uint256 constant IC26x = 19916462590752724499596353246420585076838476718015075955054294729727410855052;
    uint256 constant IC26y = 18439054258950949824497610575846068813095814346286394453348249756691397802700;
    
    uint256 constant IC27x = 5259422047025087583953357981920838904346481403536501618700207924961274698115;
    uint256 constant IC27y = 13626934255316830703463810287374382172474996291473787228517451927462359073895;
    
    uint256 constant IC28x = 10295968405153089467853110756871059092549386112717492464514188824656530481923;
    uint256 constant IC28y = 10660170887914338656363974635713925041036123242884613020616547482706911042884;
    
    uint256 constant IC29x = 5547599898248057752693225429179050947968669986954135712262310664553585684450;
    uint256 constant IC29y = 8580744323465017327252203284562813657664652577089340561722597115968516247608;
    
    uint256 constant IC30x = 3565650366097610355051424129922256458722889589098283302054969053120931840718;
    uint256 constant IC30y = 21597083382012344156569213830632437938225586699046090665078536665878256771113;
    
    uint256 constant IC31x = 1914108429354202716157816374047588991361775442538893563761334165444536701847;
    uint256 constant IC31y = 14083730228099098256238241193429875125349921585292663629823808469791735495177;
    
    uint256 constant IC32x = 13540292848718152360540071840249052119523692162607816126655960374953797539814;
    uint256 constant IC32y = 14430199106169586952822199542507631591637405446079531651095586068934193839559;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[32] calldata _pubSignals) public view returns (bool) {
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
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
