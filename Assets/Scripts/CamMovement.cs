﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CamMovement : MonoBehaviour
{
    public Transform focusPoint;
    public float camSpeed = 0.1f;

    private Vector2 lastShakeOffset = Vector2.zero;

    void FixedUpdate()
    {
        if (PlayState.gameState != "Menu")
        {
            Vector2 camBoundsX = new Vector2(
                PlayState.camCenter.x - PlayState.camBoundaryBuffers.x + PlayState.camTempBuffersX.x,
                PlayState.camCenter.x + PlayState.camBoundaryBuffers.x - PlayState.camTempBuffersX.y);
            Vector2 camBoundsY = new Vector2(
                PlayState.camCenter.y - PlayState.camBoundaryBuffers.y + PlayState.camTempBuffersY.x,
                PlayState.camCenter.y + PlayState.camBoundaryBuffers.y - PlayState.camTempBuffersY.y);
            float xDif = camBoundsX.y - camBoundsX.x;
            float yDif = camBoundsY.y - camBoundsY.x;
            Vector2 focus = ((focusPoint != null) ? new Vector2(focusPoint.position.x, focusPoint.position.y) : Vector2.zero) + PlayState.camCutsceneOffset;

            if (PlayState.gameState == "Game")
            {
                transform.position -= (Vector3)lastShakeOffset;
                bool inBoundsX = ((camBoundsX.x <= (focus.x + 13.5f)) && ((focus.x - 13.5f) <= camBoundsX.y));
                bool inBoundsY = ((camBoundsY.x <= (focus.y + 8.5f)) && ((focus.y - 8.5f) <= camBoundsY.y));
                if (!(inBoundsX && inBoundsY) && !PlayState.playerScript.inDeathCutscene)
                {
                    transform.position = new Vector2(
                        Mathf.Lerp(transform.position.x, focus.x, camSpeed),
                        Mathf.Lerp(transform.position.y, focus.y, camSpeed));
                }
                else
                {
                    transform.position = new Vector2(
                        xDif >= 0 ? Mathf.Clamp(Mathf.Lerp(transform.position.x, focus.x, camSpeed), camBoundsX.x, camBoundsX.y) : camBoundsX.x + (xDif * 0.5f),
                        yDif >= 0 ? Mathf.Clamp(Mathf.Lerp(transform.position.y, focus.y, camSpeed), camBoundsY.x, camBoundsY.y) : camBoundsY.x + (yDif * 0.5f));
                }
                transform.position += (Vector3)PlayState.camShakeOffset;
                lastShakeOffset = PlayState.camShakeOffset;
            }

            Debug.DrawLine(
                new Vector2(PlayState.camCenter.x - PlayState.camBoundaryBuffers.x, PlayState.camCenter.y + PlayState.camBoundaryBuffers.y),
                new Vector2(PlayState.camCenter.x + PlayState.camBoundaryBuffers.x, PlayState.camCenter.y + PlayState.camBoundaryBuffers.y),
                Color.green,
                0,
                false);
            Debug.DrawLine(
                new Vector2(PlayState.camCenter.x - PlayState.camBoundaryBuffers.x, PlayState.camCenter.y - PlayState.camBoundaryBuffers.y),
                new Vector2(PlayState.camCenter.x + PlayState.camBoundaryBuffers.x, PlayState.camCenter.y - PlayState.camBoundaryBuffers.y),
                Color.green,
                0,
                false);
            Debug.DrawLine(
                new Vector2(PlayState.camCenter.x - PlayState.camBoundaryBuffers.x, PlayState.camCenter.y - PlayState.camBoundaryBuffers.y),
                new Vector2(PlayState.camCenter.x - PlayState.camBoundaryBuffers.x, PlayState.camCenter.y + PlayState.camBoundaryBuffers.y),
                Color.green,
                0,
                false);
            Debug.DrawLine(
                new Vector2(PlayState.camCenter.x + PlayState.camBoundaryBuffers.x, PlayState.camCenter.y - PlayState.camBoundaryBuffers.y),
                new Vector2(PlayState.camCenter.x + PlayState.camBoundaryBuffers.x, PlayState.camCenter.y + PlayState.camBoundaryBuffers.y),
                Color.green,
                0,
                false);
        }
    }
}
