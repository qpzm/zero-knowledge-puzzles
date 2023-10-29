const chai = require('chai');
const { wasm } = require('circom_tester');
const path = require("path");
const F1Field = require("ffjavascript").F1Field;
const Scalar = require("ffjavascript").Scalar;
exports.p = Scalar.fromString("21888242871839275222246405745257275088548364400416034343698204186575808495617");
const Fr = new F1Field(exports.p);

const wasm_tester = require("circom_tester").wasm;

const assert = chai.assert;

describe("IsZero Test ", function (){
    this.timeout(100000);

    it("Check IsZero", async()=>{
        const circuit = await wasm_tester(path.join(__dirname,"../IsZero","IsZero.circom"));
        await circuit.loadConstraints();
        let witness ;
        const expectedOutput = 1;

        // console.log(Fr.e(3n).())

        witness = await circuit.calculateWitness({"in":[0]},true);
        console.log(witness)
        assert(Fr.eq(Fr.e(witness[0]), Fr.e(1)));
        assert(Fr.eq(Fr.e(witness[1]), Fr.e(expectedOutput)));

        // Do not pass when out = 1, in != 0, inv = 0.
        // witness = await circuit.calculateWitness({"in":[2]},true);
        witness = [1n, 1n, 1n, 0n]; // [1 out in inv]
        console.log(witness)
        await circuit.checkConstraints(witness)
        let expectedOutput2 = 0;
        // assert(Fr.eq(Fr.e(witness[0]), Fr.e(1)));
        // assert(Fr.eq(Fr.e(witness[1]), Fr.e(expectedOutput2)));
    })
})
