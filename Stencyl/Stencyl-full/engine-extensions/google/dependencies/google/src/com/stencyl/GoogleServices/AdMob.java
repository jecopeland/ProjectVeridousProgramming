package com.stencyl.GoogleServices;

import org.haxe.extension.Extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.LinearLayout;
import android.view.Gravity;
import android.view.animation.Animation;
import android.view.animation.AlphaAnimation;
import android.util.Log;

import com.google.android.gms.ads.*;

import dalvik.system.DexClassLoader;

public class AdMob extends Extension
{
	private static LinearLayout layout;
    
    private static boolean initialized = false;

	static AdView adView;
    static InterstitialAd interstitial;
    
    /// --- Banners --- ///

	static public void initBanner(final String adUnitID, final int position)
	{
		mainActivity.runOnUiThread(new Runnable()
		{
        	public void run()
			{
                adView = new AdView(mainActivity);
                adView.setAdSize(AdSize.BANNER);
                adView.setAdUnitId(adUnitID);
                
				layout = new LinearLayout(mainActivity);
                
                setBannerPosition(position);
                
                AdRequest adRequest = new AdRequest.Builder().build();
    			adView.loadAd(adRequest);
                
                layout.addView(adView);
                mainActivity.addContentView(layout, new LayoutParams(LayoutParams.FILL_PARENT, LayoutParams.FILL_PARENT));
                
                adView.setVisibility(AdView.GONE);
            }
        });
	}

	static public void showBanner()
	{
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run() 
			{
				if(adView != null && adView.getVisibility() == AdView.GONE)
				{
     				adView.setVisibility(AdView.VISIBLE);
                    
                    Animation animation1 = new AlphaAnimation(0.0f, 1.0f);
                    animation1.setDuration(1000);
                    layout.startAnimation(animation1);
				}
            }
        });
    }

	static public void hideBanner()
	{
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run() 
        	{
				if(adView != null && adView.getVisibility() == AdView.VISIBLE)
				{
                    Animation animation1 = new AlphaAnimation(1.0f, 0.0f);
                    animation1.setDuration(1000);
                    layout.startAnimation(animation1);
                    
                    final Handler handler = new Handler();
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            adView.setVisibility(AdView.GONE);
                        }
                    }, 1000);
				}
            }
        });
	}
    
    static public void setBannerPosition(final int position)
    {
        mainActivity.runOnUiThread(new Runnable()
                                   {
        	public void run()
        	{
                if(position == 0) //Bottom-Center
                {
                    layout.setGravity(Gravity.CENTER_HORIZONTAL|Gravity.BOTTOM);
                }
                else //Top-Center
                {
                    layout.setGravity(Gravity.CENTER_HORIZONTAL);
                }
            }
        });
    }
    
    /// --- Other(Banners) --- ///
    
    @Override
    public void onPause() {
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run()
        	{
                if (adView != null) {
                    adView.pause();
                }
            }
        });
        
        super.onPause();
    }
    
    @Override
    public void onResume() {
        super.onResume();
        
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run()
        	{
                if (adView != null) {
                    adView.resume();
                }
            }
        });
    }
    
    @Override
    public void onDestroy() {
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run()
        	{
                if (adView != null) {
                    adView.destroy();
                }
            }
        });
        
        super.onDestroy();
    }
}