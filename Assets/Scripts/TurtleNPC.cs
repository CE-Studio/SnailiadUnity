using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TurtleNPC : NPC
{
    public SpriteRenderer sprite;
    
    public override void Awake()
    {
        playerName = "Snaily";

        sprite = GetComponent<SpriteRenderer>();
        anim = GetComponent<Animator>();
    }

    public override void Update()
    {
        if (PlayState.gameState == "Game")
        {
            anim.speed = 1;
            if (PlayState.player.transform.position.x < transform.position.x)
            {
                sprite.flipX = true;
            }
            else
            {
                sprite.flipX = false;
            }

            if (Vector2.Distance(transform.position, PlayState.player.transform.position) < 3 && !chatting)
            {
                List<string> textToSend = new List<string>();
                textToSend.Add("After this game is over, I\'m\ngoing to get some pizza!!\n");
                chatting = true;
                PlayState.OpenDialogue(2, 52, textToSend);
            }
            else if (Vector2.Distance(transform.position, PlayState.player.transform.position) > 5 && chatting)
            {
                chatting = false;
                PlayState.CloseDialogue();
            }
        }
        else
            anim.speed = 0;
    }
}
