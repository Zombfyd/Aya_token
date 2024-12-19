module aya::aya {
    use sui::coin::{Self, TreasuryCap, CoinMetadata};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use std::option;
    use sui::url;

    struct AYA has drop {
        dummy_field: bool
    }

    fun init(witness: AYA, ctx: &mut TxContext) {
        let (treasury_cap, metadata) = coin::create_currency(
            witness, 
            6,
            b"AYA",
            b"Aya Asagiri",
            b"4179612041736167697269202d20616e2049636f6e6963204d656d6520616e64204368617261637465722066726f6d204d61676963616c204769726c2053697465202d205465617273206172652057617465722c204d616e6761206973204a6170616e6573652c20537569206973204a6170616e65736520666f72205761746572200a",
            option::some(url::new_unsafe_from_bytes(b"https://api.movepump.com/uploads/aya_with_sui_tear_aa38eb3d00.png")),
            ctx
        );
        
        transfer::public_transfer(treasury_cap, tx_context::sender(ctx));
        transfer::public_share_object(metadata);
    }
}