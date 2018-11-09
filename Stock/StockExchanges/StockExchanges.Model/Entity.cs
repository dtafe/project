﻿using System;
using System.Collections.Generic;
using System.Text;

namespace StockExchanges.Model
{

    public abstract class BaseEntity
    {

    }

    public abstract class Entity<T> : BaseEntity, IEntity<T>
    {
        public virtual T Id { get; set; }
    }
}
