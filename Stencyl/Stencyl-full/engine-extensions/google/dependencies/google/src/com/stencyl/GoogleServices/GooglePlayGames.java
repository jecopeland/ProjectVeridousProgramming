package com.stencyl.GoogleServices;

import org.haxe.extension.Extension;

import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;
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
import android.support.v4.app.FragmentActivity;

import com.google.android.gms.common.api.*;
import com.google.android.gms.games.*;
import com.google.android.gms.games.quest.*;
import com.google.android.gms.games.event.*;
import com.google.example.games.basegameutils.BaseGameActivity;
import com.google.example.games.basegameutils.GameHelper;
import com.google.example.games.basegameutils.GameHelper.GameHelperListener;

public class GooglePlayGames extends Extension implements QuestUpdateListener, ResultCallback
{
    static GameHelper mHelper;
    static HashMap<String, String> questRewards = new HashMap<String,String>();
    static ArrayList<String> completedQuests = new ArrayList<String>();
    static boolean newQuestCompleted = false;
	static GooglePlayGames mpg = null;
    
    public GooglePlayGames()
    {
    	super();
    	
    	mpg = this;
    }
    
    static public void initGooglePlayGames()
    {
        Log.d("GPG", "Initialiazing Google Play Games (Java)");        
        
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run()
        	{
                if (mHelper == null){
				
					mHelper = new GameHelper(mainActivity, GameHelper.CLIENT_GAMES);
					
					GameHelperListener listener = new GameHelper.GameHelperListener() {
						@Override
						public void onSignInSucceeded() {
							// handle sign-in succeess
							Log.d("GPG", "onSignInSucceeded");
							Games.Quests.registerQuestUpdateListener(mHelper.getApiClient(), mpg);
							
							PendingResult pr = Games.Quests.load(mHelper.getApiClient(), new int[]{Games.Quests.SELECT_COMPLETED}, Games.Quests.SORT_ORDER_ENDING_SOON_FIRST, false);
							pr.setResultCallback(mpg);							
						}
						@Override
						public void onSignInFailed() {
							// handle sign-in failure (e.g. show Sign In button)
							Log.d("GPG", "onSignInFailed");
							Log.d("GPG", "user cancelled: " + mHelper.hasUserCancellation());
						}
						
					};
					mHelper.setup(listener);
				}
                                
                mHelper.beginUserInitiatedSignIn();
            }
        });
    }
	
	static public void signOutGooglePlayGames()
    {
        Log.d("GPG", "Signing out from Google Play Games (Java)");
        
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run()
        	{
                 if (mHelper != null && mHelper.isSignedIn())
                {
					mHelper.signOut();
				}
            }
        });
    }
	
	static public boolean isSignedIn()
	{
		if (mHelper != null && mHelper.isSignedIn())
        {
			return true;
		}
		else return false;
	}
	
	static public boolean isConnecting()
	{
		if (mHelper != null && mHelper.isConnecting())
        {
			return true;
		}
		else return false;
	}
	
	static public boolean hasSignInError()
	{
		if (mHelper != null && mHelper.hasSignInError())
        {
			return true;
		}
		else return false;
	}
	
	static public boolean hasUserCancellation()
	{
		
		if (mHelper != null && mHelper.hasUserCancellation())
        {
			return true;
		}
		else return false;
	}	
    
    static public void showAchievements()
    {
        Log.d("GPG", "Showing Achievements (Java 1)");
        
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run()
        	{
                if (mHelper != null && mHelper.isSignedIn())
                {
                    Log.d("GPG", "Showing Achievements (Java 2)");
                    mainActivity.startActivityForResult(Games.Achievements.getAchievementsIntent(mHelper.getApiClient()), 1);
                }
            }
        });
    }
    
    static public void unlockAchievement(String id)
    {
        Log.d("GPG", "Unlocking Achievement " + id + " (Java)");        
        
        if (mHelper != null && mHelper.isSignedIn())
        {
            Games.Achievements.unlock(mHelper.getApiClient(), id);
        }
    }
    
    static public void incrementAchievement(String id, int numSteps)
    {
        Log.d("GPG", "Incrementing Achievement " + id + " (Java 1)");
        
        if (mHelper != null && mHelper.isSignedIn())
        {
               	Log.d("GPG", "Incrementing Achievement " + id + " (Java 2)");
                Games.Achievements.increment(mHelper.getApiClient(), id, numSteps);
        }
            
    }
    
    static public void unlockAchievementImmediate(String id)
    {
        Log.d("GPG", "Unlocking Achievement Immediate: " + id + " (Java)");        
        
        if (mHelper != null && mHelper.isSignedIn())
        {
            Games.Achievements.unlockImmediate(mHelper.getApiClient(), id);
        }
    }
    
    static public void incrementAchievementImmediate(String id, int numSteps)
    {
        Log.d("GPG", "Incrementing Achievement Immediate: " + id + " (Java 1)");
        
        if (mHelper != null && mHelper.isSignedIn())
        {
                Games.Achievements.incrementImmediate(mHelper.getApiClient(), id, numSteps);
        }
            
    }
	
	static public void showAllLeaderboards()
    {
        Log.d("GPG", "Showing Leaderboards (Java 1)");
        
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run()
        	{
                if (mHelper != null && mHelper.isSignedIn())
                {
                    Log.d("GPG", "Showing All Leaderboards (Java 2)");
                    mainActivity.startActivityForResult(Games.Leaderboards.getAllLeaderboardsIntent(mHelper.getApiClient()), 1);
                }
            }
        });
    }
	
	
    
    static public void showLeaderboard(final String id)
    {
        Log.d("GPG", "Showing Leaderboards (Java 1)");
        
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run()
        	{
                if (mHelper != null && mHelper.isSignedIn())
                {
                    Log.d("GPG", "Showing Leaderboards (Java 2)");
                    mainActivity.startActivityForResult(Games.Leaderboards.getLeaderboardIntent(mHelper.getApiClient(), id), 1);
                }
            }
        });
    }
    
    static public void submitScore(String id, int score)
    {
        Log.d("GPG", "Submitting Score " + score + " to " + id + " (Java 1)");
        
        if (mHelper != null && mHelper.isSignedIn())
        {
        	Log.d("GPG", "Submitting Score " + score + " to " + id + " (Java 2)");
            Games.Leaderboards.submitScore(mHelper.getApiClient(), id, score);
        }
            
    }
    
    static public void updateEvent(String id, int amount)
    {
        Log.d("GPG", "Updating Event " + id + " by " + amount + " (Java 1)");
        
        if (mHelper != null && mHelper.isSignedIn())
        {
        	Log.d("GPG", "Updating Event " + id + " by " + amount + " (Java 2)");
            Games.Events.increment(mHelper.getApiClient(), id, amount);
        }            
    }
    
    static public void showQuests()
    {
        Log.d("GPG", "Showing Quests (Java 1)");
        
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run()
        	{
                if (mHelper != null && mHelper.isSignedIn())
                {
                    Log.d("GPG", "Showing Quests (Java 2)");
                    mainActivity.startActivityForResult(Games.Quests.getQuestsIntent(mHelper.getApiClient(), new int[]{Quests.SELECT_OPEN, Quests.SELECT_UPCOMING, Quests.SELECT_ACCEPTED, Quests.SELECT_COMPLETED}), 1);
                }
            }
        });
    }
    
    static public String getQuestReward(String id)
    {
    	return questRewards.get(id);
    }
    
    static public String[] getCompletedQuestList()
    {
    	
    	return completedQuests.toArray(new String[completedQuests.size()]);    	
    }
    
    static public boolean hasNewQuestCompleted()
    {
    	if (newQuestCompleted)
    	{
    		newQuestCompleted = false;
    		return true;
    	}
    	
    	return false;
    }
    
    public void onStart()
    {
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run()
        	{
                if (mHelper != null)
                {
                    mHelper.onStart(mainActivity);
                }
            }
        });
    }
    
    public void onStop()
    {
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run()
        	{
                if (mHelper != null)
                {
                    mHelper.onStop();
                }
            }
        });
    }
    
    public boolean onActivityResult(int request, int response, Intent data)
    {
        final int req = request;
        final int res = response;
        final Intent dat = data;
        
        mainActivity.runOnUiThread(new Runnable()
        {
        	public void run()
        	{
                if (mHelper != null)
                {
                    mHelper.onActivityResult(req, res, dat);
                }
            }
        });
        
        return true;
    }
    
    public void onResult(Result result) 
    {
    	if (result == null || !(result instanceof Quests.LoadQuestsResult))
    	{
    		return;
    	}
    	
        Quests.LoadQuestsResult r = (Quests.LoadQuestsResult)result;
        QuestBuffer qb = r.getQuests();

        completedQuests.clear();
        
        if (qb != null)
        {
        	for (int i=0; i < qb.getCount(); i++) {
        		completedQuests.add(qb.get(i).getQuestId());
        	}
        	
        	qb.close();        	
        }
        
        
    }
    
    public void onQuestCompleted(Quest quest) {

    	Log.d("GPG", "New Quest Completed, Updating info. (Java 1)");
        // Claim the quest reward.
        Games.Quests.claim(mHelper.getApiClient(), quest.getQuestId(),
                quest.getCurrentMilestone().getMilestoneId());

        // Process the RewardData to provision a specific reward.
        String reward = new
              String(quest.getCurrentMilestone().getCompletionRewardData(),
              Charset.forName("UTF-8"));

        // Provision the reward; this is specific to your game. Your game
        // should also let the player know the quest was completed and
        // the reward was claimed; for example, by displaying a toast.
        // ...
                
        questRewards.put(quest.getQuestId(), reward);    
        completedQuests.add(quest.getQuestId());
        newQuestCompleted = true;
    }
}